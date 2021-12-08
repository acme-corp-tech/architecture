#!/usr/bin/env bash

for service in frontend auth cart order goods payment
do
  for file in ${service}_system.puml ${service}_components.puml ${service}_relations.puml
  do
    url="https://raw.githubusercontent.com/fincompare/${service}/master/dev/diagrams/${file}"
    echo "$url"
    curl -s --fail -H "Authorization: Bearer $GITHUB_TOKEN" "$url" --output "./diagrams/$file" || echo "$file not found"
  done
done
