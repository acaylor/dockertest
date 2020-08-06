# Pull the image and call it base
FROM golang:1.13.7-alpine3.11 
# Copy the code
COPY src /codebase/src
RUN ls /codebase/src/main.go
# Build the binary
RUN cd /codebase && go build -v -o /codebase/bin/server ./src/main.go
# Set the env which will be available at runtime
ENV PORT=8080
# Specify the run command for the binary
CMD ["sh", "-c", "/codebase/bin/server"]
