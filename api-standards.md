# Acme Pet Supplies API Standards

## REST URIs

### [S1] URIs MUST be kebab case.

URIs MUST be in kebab case (lowercase, spearated by hyphens).

#### Example:

`/product-categories`

## Operations

### [S2] OpenAPI opearation IDs must be in camel case.

#### Example:

`operationId: ListItems`

## Pagination

### [S3] Requests for collections MUST be paginated

Collections of data items MUST support pagination to protect the server and enable the client iterate to a large result set.

APIs MUST use cursor based pagination. Each page of the result set has a a unique cursor, an opaque value used to identify and iterate through pages.

#### Displaying pagination information.

- 'data': Items in the result set.
- 'meta': an object containing pagination information.
- 'self': Cursor pointing to the current page.
- 'first': Cursor to the first page
- 'prev': Cursor to the previous page.
- 'next': Cursor to the next page.
- 'last': Cursor to the last page.

#### Example pagination

```json
{
  "data": [...],
  "meta": {
    "self": "https://api.acme-pet-supplies.com/v1/catalog/product-categories?cursor=<current-page>",
    "first": "https://api.acme-pet-supplies.com/v1/catalog/product-categories?cursor=<first-page>",
    "prev": "https://api.acme-pet-supplies.com/v1/catalog/product-categories?cursor=<previous-page>",
    "next": "https://api.acme-pet-supplies.com/v1/catalog/product-categories?cursor=<next-page>",
    "last": "https://api.acme-pet-supplies.com/v1/catalog/product-categories?cursor=<last-page>"
  }
```
