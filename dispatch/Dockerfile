# Start from the official Golang image
FROM golang:1.20

# Set environment variables
ENV GOPATH=/app/go \
    GOCACHE=/tmp/go-build-cache \
    AMQP_HOST=rabbitmq.lingaiah.online \
    AMQP_USER=roboshop \
    AMQP_PASS=roboshop123

# Create working directories
RUN mkdir -p /app /tmp/go-build-cache
WORKDIR /app

# Download and unzip dispatch source code
ADD https://roboshop-builds.s3.amazonaws.com/dispatch.zip /tmp/dispatch.zip
RUN apt-get update && apt-get install -y unzip curl \
    && unzip /tmp/dispatch.zip -d /app \
    && rm /tmp/dispatch.zip

# Initialize Go module, download dependencies, and build
RUN go mod init dispatch \
    && go get \
    && go build -o dispatch

# Create roboshop user
RUN useradd -m roboshop

# Set ownership and switch to non-root user
RUN chown -R roboshop:roboshop /app
USER roboshop

# Expose port if required (example: 8080)
EXPOSE 8080

# Run the dispatch binary
CMD ["/app/dispatch"]
