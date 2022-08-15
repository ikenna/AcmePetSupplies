# API Profile

## API Product Name

Product Catalog API

## API Consumer

The end user is a customer browsing Acme Pet Supplies products in order to make a purchase. They may do this via 3 main channels:

1. The Acme mobile app (Acme channel)
2. The Acme web store (Acme channel)
3. An affiliate's store.

## Job Stories

When I need a product to care for my pet, I want to discover a great range of products in that category with quality reviews, so I can choose which I like.

## User Tasks

- Browse for pet products in the Acme catalog. (MVP)
- Search for pet products in the Acme catalog. (Phase 2)

## API Technology Solution and Versioning Strategy

This is a REST API. It will use path level versioning

## Access Level

Public API, made available for use by both Acme owned digital channels and to registered affiliates.

## Usage Plans

- **Acme mobile app:** 5 requests a minute
- **Acme web store :** 5 requests a minute
- **Affiliate stores:** 4 requests a minute

## Security Model

Secure the API with an API key to identify the application channel the traffic is coming from. API keys will be generated and managed via the dev portal.

## API Product Manager

John Smith
