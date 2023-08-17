#!/bin/sh

# Initialize blog if root folder is empty
if [ -z "$(ls)" ]; then
	hexo init ./
fi

# Populate arguments based on environment variables
hexo clean
hexo generate

if [ "${HEXO_USE_SERVER}" = true ]; then
	hexo server -i -s
fi
