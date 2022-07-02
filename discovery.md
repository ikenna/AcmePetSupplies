


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


# API Technology solution
REST API

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

# API operation profile
|User Tasks| Operation Name| Operation Description |Participant| Web Resource | Request | Response | HTTP Method| Resource Path|  
|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|
|Browse for products| listProductCategories |List all product categories, providing the number of products in a category. A small collection so pagination not required.  | Customer | ProductCategory|   | ProductCategory[] | GET | /product-categories |
|Browse for products| listProductsInACategory |List all products in a category, providing ordering and pagination parameters  | Customer | ProductCategory| Product Category ID, sort by field, order direction, page size, page token (cursor) | product name, product rating, product URI, pagination info | GET | /product-categories/{productCategoryId}/products?sortBy={sortingAttribute}&orderBy={orderingDirection}&pageToken={pageToken}&maxPageSize={maxPageSize} |
|Browse for products| viewProduct |View a product's details | Customer | Product | Product ID   | Product | GET | /product/{productId} |
|Browse for products| listProductReviews |Get all reviews for a product | Customer | Reviews |   | ProductReviews[] | GET | /product-reviews/{productReviewId} |


# Web Resources

```mermaid
erDiagram
  PRODUCT { 
    uuid productId "Identifier for the product"
    string name "Name of the product"
    string description "A description of the product"
    number price "Price of the product"
    array keywords "A colleciton of words that describe the product, used for searching for it."
    array productCategoryLinks "The links and names of the product categories to which the product belongs."
    number reviewRating "Average product review rating"
    number numberOfReviews "Number of product reviews"
  }    
```

```mermaid
erDiagram  
  PRODUCT_CATEGORY {
    uuid produCtCategoryId "Identifier of the category"
    string name "Name of the product category"
    number numberOfProducts "Number of products in the category"
    array productLinks "The link and names of the products in this category"
  }
```

```mermaid
erDiagram  
  PRODUCT_REVIEW {
    uuid productReviewId "Identifier for a product review"
    string content "Review content"
    number rating "The rating of the review. A number in the range 1 to 5, 1 for lowest and 5 for highest."
    string authorName "Name of the author of the review"
    submittedDate dateTime "Date the review was submitted"
  }
```

# Web Resource Relationships

```mermaid
erDiagram
    PRODUCT ||--|{ PRODUCT_CATEGORY : associated_with
    PRODUCT ||--o{ PRODUCT_REVIEW : has_a
```


# API Sequence diagram



```mermaid 
sequenceDiagram
    Customer ->>+ Product Catalog API: listProductCategories()
    Product Catalog API ->>+ Category Microservice: listProductCategories()
    Category Microservice -->>- Product Catalog API :  ProductCategory[]
    Product Catalog API -->>- Customer:  ProductCategory[]
    Customer ->>+ Product Catalog API: listProductsInACategory()
    Product Catalog API ->>+ Category Microservice: listProductsInACategory()
    Category Microservice -->>- Product Catalog API :  Product[], paginationInfo
    Product Catalog API -->>- Customer:  Product[], paginationInfo
    Customer ->>+ Product Catalog API: viewProduct()
    Product Catalog API ->>+ Product Microservice: viewProduct()
    Product Microservice -->>- Product Catalog API:  Product
    Product Catalog API -->>- Customer:  Product
    Customer ->>+ Product Catalog API: getProductReviews()
    Product Catalog API ->>+ Reviews Microsrevice: getProductReviews()
    Reviews Microsrevice -->>- Product Catalog API: ProductReviews[], paginationInfo
    Product Catalog API -->>- Customer:  ProductReviews[], paginationInfo
   
```            







