# Pull the image and call it base
FROM alpine:3.11 as base
# Copy the code
COPY src /codebase/src
# Build the binary
RUN cd /codebase && go build -v -o bin/server src/*.go
