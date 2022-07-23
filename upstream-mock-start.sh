#!/bin/bash

# Using Prism to mock upstream service 
prism mock --port 3050 reference/compliant-product-catalog-api.oas.yaml > prism-mock.log 2>&1 & 