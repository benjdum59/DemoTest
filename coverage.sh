#!/bin/bash

slather coverage -x --output-directory report-output-dir --scheme DemoTest --workspace DemoTest.xcworkspace DemoTest.xcodeproj

echo "Please provide Codacy token"
read -s token

export CODACY_API_TOKEN=$token
export CODACY_ORGANIZATION_PROVIDER=gh
export CODACY_USERNAME=benjdum59
export CODACY_PROJECT_NAME=DemoTest

echo "token:" $token

bash <(curl -Ls https://coverage.codacy.com/get.sh) report -r report-output-dir/cobertura.xml

