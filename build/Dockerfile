FROM alpine:latest

# Install required dependencies
RUN apk add --update --no-cache git nodejs npm

# Install Hexo command line interface
RUN npm install \
        -g \
        --loglevel=error \
        --unsafe-perm=true \
            hexo-cli \
            hexo-server

RUN addgroup -S hexo -g 1000 && \
    adduser -S hexo -g '' -u 1000 -G hexo && \
    mkdir -p /home/hexo/.hexo && \
    chown hexo:hexo /home/hexo/.hexo

# Copy and run entrypoint script
USER hexo
WORKDIR /home/hexo/.hexo