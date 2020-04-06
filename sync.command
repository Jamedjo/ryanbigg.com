#!/bin/bash
cd ~/code/ryanbigg.com
bundle exec jekyll build
aws s3 sync _site s3://ryanbigg.com --acl public-read --delete

# Invalid CloudFront caches, otherwise new content will not display.

aws cloudfront create-invalidation --distribution-id E2VMVK9PHS2KRO --paths '/*'
