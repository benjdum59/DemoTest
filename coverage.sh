#!/bin/bash

rm -rf report-output-dir/cobertura.xml

slather

echo "Please provide Codacy token"
read -s token

export CODACY_API_TOKEN=$token
export CODACY_ORGANIZATION_PROVIDER=gh
export CODACY_USERNAME=benjdum59
export CODACY_PROJECT_NAME=DemoTest

git add .
git commit -m "code coverage report"
git push origin master

commit=$(git rev-parse HEAD)


bash <(curl -Ls https://coverage.codacy.com/get.sh) report -l Swift --force-language -r report-output-dir/cobertura.xml --commit-uuid "$commit"

