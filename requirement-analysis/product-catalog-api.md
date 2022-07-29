


# API product name
Product Catalog API

# API Consumer
The end user is a customer browsing Acme Pet Supplies products in order to make a purchase. They may do this via 3 main channels: 
1. The Acme mobile app (Acme channel)
2. The Acme web store (Acme channel)
3. An affiliate's store. 


# Job Stories (core problem solving benefit)

When I need a product to care for my pet, I want to discover a great range of products in that category with quality reviews, so I can chose which I like.

# User tasks
- Browse for pet products in the Acme catalog. (MVP)
- Search for pet products in the Acme catalog. (Phase 2)


# API Technology Solution and Versioning Strategy
This is a REST API. It will use path level versioning 

# Access Level
Public API, made available for use by both Acme owned digital channels and to registered affiliates. 

# Usage plans
- **Acme mobile app:** 5 requests a minute
- **Acme  web store :** 5 requests a minute
- **Affiliate stores:** 4 requests a minute


# Security model
Secure the API with an API key to identify the application channel the traffic is coming from. API keys will be generated and managed via the dev portal. 

# API product manager
John Smith

# API operations
|User Tasks| Operation Name| Operation Description |Participant| Web Resource | Request | Response | HTTP Method| Resource Path| Response Code|   
|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
|Browse for products| listCategories |List all categories. | Customer | Category | Filter by field, sort by field, order direction, page size, page cursor  | Category[], PaginationInfo | GET | /categories | 200 |
|Browse for products| listProducts |List all products. | Customer | Product| Filter by field, sort by field, order direction, page size, page cursor | Product[], PaginationInfo | GET | /products |  200 |
|Browse for products| viewProduct |View a product's details. | Customer | Product | Product ID   | Product | GET | /products/{productId} | 200 |
|Browse for products| listReviews |Get all reviews. | Customer | Review |  Filter by field, sort by field, order direction, page size, page cursor | Reviews[], PaginationInfo | GET | /reviews |  200 |


# Web Resources

A category is a class of products with common characteristics. A category can contain zero or more products. 
A product is an item for sale on the store. A product belongs to at least one category and has zero or more reviews. 
A review is a critical assesment of a product by a customer. A revivew is associated to one and only one product.


```mermaid
erDiagram
  PRODUCT { 
    uuid productId "Identifier for the product"
    string name "Name of the product"
    string description "A description of the product"
    number price "Price of the product"
    array keywords "A colleciton of words that describe  the product, used for searching for it."
    array productCategoryLinks "The links and names of the product categories to which the product belongs."
    number reviewRating "Average product review rating"
    number numberOfReviews "Number of product reviews"
  }    
```

```mermaid
erDiagram  
  CATEGORY {
    uuid categoryId "Identifier of the category"
    string name "Name of the product category"
    array productLinks "The link and names of the products in this category"
  }
```

```mermaid
erDiagram  
  REVIEW {
    uuid reviewId "Identifier for a product review"
    string content "Review content"
    number rating "The rating of the review. A number in the range 1 to 5, 1 for lowest and 5 for highest."
    string authorName "Name of the author of the review"
    submittedDate dateTime "Date the review was submitted"
  }
```

# Web Resource Relationships

```mermaid
erDiagram
    PRODUCT }o--|{ CATEGORY : associated_with
    PRODUCT ||--o{ REVIEW : has_a
```


# API Sequence diagram

```mermaid 
sequenceDiagram
    Customer ->>+ API Gateway: listCategories()
    API Gateway ->>+ Product Catalog API Service : listCategories()
    Product Catalog API Service ->>+ Category Microservice: listCategories()
    Category Microservice -->>- Product Catalog API Service :  Category[]
    Product Catalog API Service -->>- API Gateway:  Category[]
    API Gateway -->>- Customer:  Category[]

    Customer ->>+ API Gateway: listProducts()
    API Gateway ->>+ Product Catalog API Service: listProducts()
    Product Catalog API Service ->>+ Product Microservice: listProducts()
    Product Microservice -->>- Product Catalog API Service :  Product[], paginationInfo
    Product Catalog API Service -->>- API Gateway :  Product[], paginationInfo
    API Gateway -->>- Customer:  Product[], paginationInfo

    Customer ->>+ API Gateway: viewProduct()
    API Gateway ->>+ Product Catalog API Service: viewProduct()
    Product Catalog API Service ->>+ Product Microservice: viewProduct()
    Product Microservice -->>- Product Catalog API Service:  Product
    Product Catalog API Service -->>- API Gateway:  Product
    API Gateway -->>- Customer:  Product

    Customer ->>+ API Gateway: listReviews()
    API Gateway ->>+ Product Catalog API Service: listReviews()
    Product Catalog API Service ->>+ Reviews Microsrevice: listReviews()
    Reviews Microsrevice -->>- Product Catalog API Service: Reviews[], paginationInfo
    Product Catalog API Service -->>- API Gateway:  Reviews[], paginationInfo
    API Gateway -->>- Customer:  Reviews[], paginationInfo
   
```            







