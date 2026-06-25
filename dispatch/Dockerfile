# Use a full Debian-based Golang image
FROM golang:1.20-bullseye

# Set environment variables
ENV GOPATH=/app/go \
    GOCACHE=/tmp/go-build-cache \
    AMQP_HOST=rabbitmq \
    AMQP_USER=roboshop \
    AMQP_PASS=roboshop123

# Create working directories
RUN mkdir -p /app /tmp/go-build-cache
WORKDIR /app

# Install unzip and curl
RUN apt-get update && apt-get install -y unzip curl

# Download and unzip dispatch code
RUN curl -L -o /tmp/dispatch.zip https://roboshop-builds.s3.amazonaws.com/dispatch.zip \
    && unzip /tmp/dispatch.zip -d /app \
    && rm /tmp/dispatch.zip

# Initialize Go module and build
RUN go mod init dispatch \
    && go get \
    && go build -o dispatch

# Create a non-root user
RUN useradd -m roboshop && chown -R roboshop:roboshop /app
USER roboshop

# Expose port (adjust if needed)
EXPOSE 8080

# Run the dispatch binary
CMD ["/app/dispatch"]
