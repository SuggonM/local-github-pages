#!/bin/bash
bundler exec jekyll serve --livereload --source "${1:-.}"
