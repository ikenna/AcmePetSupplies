#!/bin/bash

# Using Prism as validation proxy
prism proxy api-definitions/compliant-product-catalog-api.oas.yaml http://127.0.0.1:8000  --errors --port 4010 > prism-proxy.log 2>&1 &  
