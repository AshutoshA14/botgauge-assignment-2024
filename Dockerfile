# syntax=docker/dockerfile:1

# Use the official Golang image as the base image
FROM golang:1.22.3-alpine3.20 AS builder

# Set labels
LABEL maintainer="apooorva01@gmail.com"
LABEL description="A simple Go app that serves 'Hello from Botgauge' at the /hello path"
LABEL version="1.0"

# Set the Current Working Directory inside the container
WORKDIR /usr/app

# Copy the Go Modules files
COPY go_app/go.mod ./

# Download all dependencies
RUN go mod download

# Copy the source code into the container

COPY go_app/hello-from-botgauge.go ./

# Build the Go app
RUN go build -o hello-from-botgauge


# Final image with deployable artifact
FROM gcr.io/distroless/base-debian11

# Set the workdir

WORKDIR /

# Copy build from the pervious stage
COPY --from=builder /usr/app/hello-from-botgauge /hello-from-botgauge

# Expose port 8080 to the outside world
EXPOSE 8080


# Command to run the executable
CMD ["./hello-from-botgauge"]




