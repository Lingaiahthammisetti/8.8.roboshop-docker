# Use the official RabbitMQ base image
FROM rabbitmq:3-management

# Set environment variables for RabbitMQ default user and password
ENV RABBITMQ_DEFAULT_USER=roboshop
ENV RABBITMQ_DEFAULT_PASS=roboshop123

# Expose the default RabbitMQ and management plugin ports
EXPOSE 5672 15672

# Optional: Add a script to configure permissions on container start
# This is useful if you need to fine-tune or verify user setup beyond default ENV
COPY configure.sh /usr/local/bin/configure.sh
RUN chmod +x /usr/local/bin/configure.sh

# Run the configure script after RabbitMQ starts
CMD ["bash", "-c", "rabbitmq-server & sleep 10 && /usr/local/bin/configure.sh && tail -f /dev/null"]
