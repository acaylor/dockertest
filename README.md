# dockertest

Simple go app to demonstrate building a docker container.

## Usage

Build the container locally:

```shell
docker build --tag dockertest:local .
```

Run the container and expose the port locally.

```shell
docker run --rm -d -p 8080:8080 dockertest:local
```
