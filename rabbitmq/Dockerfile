FROM centos:8

# Set environment variables
ENV RABBITMQ_VERSION=3.12.12
ENV ERLANG_VERSION=26.2.5

# Install dependencies and RabbitMQ
RUN dnf -y install curl gnupg \
    && curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash \
    && curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash \
    && dnf -y install rabbitmq-server \
    && dnf clean all

# Copy startup and setup script
COPY configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

# Expose RabbitMQ default ports
EXPOSE 5672 15672

# Start RabbitMQ and run the setup
CMD ["/usr/local/bin/configure.sh"]
