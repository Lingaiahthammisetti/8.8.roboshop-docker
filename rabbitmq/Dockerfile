# Use a CentOS-based base image
FROM centos:8

# Add Erlang repo
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash

# Add RabbitMQ repo
RUN curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash

# Install RabbitMQ
RUN dnf install -y rabbitmq-server

# Install dependencies
RUN dnf install -y curl sudo net-tools

# Enable and expose RabbitMQ
EXPOSE 5672 15672

# Enable management plugin
RUN rabbitmq-plugins enable rabbitmq_management

# Add application user
RUN rabbitmq-server -detached && \
    rabbitmqctl add_user roboshop roboshop123 && \
    rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" && \
    rabbitmqctl stop

# Set entrypoint
CMD ["/usr/sbin/rabbitmq-server"]
