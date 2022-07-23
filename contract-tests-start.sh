#!/bin/bash

set -o pipefail    # Make the pipeline's return status the value of the last (rightmost) command to exit with a non-zero status, 
portman --cliOptionsFile test-config/contract/portman-cli-options.json | tee test-reports/contract.report.txt 
