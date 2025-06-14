#!/bin/bash

# Start RabbitMQ in the background
echo "Starting RabbitMQ server..."
rabbitmq-server -detached

# Wait until RabbitMQ is fully started
echo "Waiting for RabbitMQ to start..."
until rabbitmqctl status 2>/dev/null | grep -q "running_applications"; do
    sleep 2
done

# Check if the user exists
if ! rabbitmqctl list_users | grep -q roboshop; then
    echo "Adding RabbitMQ user..."
    rabbitmqctl add_user roboshop roboshop123
    echo "Setting permissions..."
    rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
else
    echo "User 'roboshop' already exists."
fi

# Keep the container running
tail -f /dev/null
