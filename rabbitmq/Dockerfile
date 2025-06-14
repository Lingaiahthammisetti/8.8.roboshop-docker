FROM rockylinux:8

# Install dependencies and RabbitMQ
RUN dnf -y install curl gnupg \
    && curl -s https://packagecloud.io/install/repositories/rabbitmq/erlang/script.rpm.sh | bash \
    && curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | bash \
    && dnf -y install rabbitmq-server \
    && dnf clean all

COPY configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

EXPOSE 5672 15672

CMD ["/usr/local/bin/configure.sh"]
