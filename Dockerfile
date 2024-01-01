# Pull the image
FROM docker.io/golang:1.21.0-alpine
# Copy the code
COPY src /codebase/src
RUN ls /codebase/src/main.go
# Build the binary
RUN cd /codebase && go build -v -o /codebase/bin/server ./src/main.go
# Set the env variables
ENV PORT=8080
# Specify the run command for the binary
CMD ["sh", "-c", "/codebase/bin/server"]
