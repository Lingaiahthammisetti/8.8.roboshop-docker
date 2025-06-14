#!/bin/bash

# Enable and start the RabbitMQ server
systemctl enable rabbitmq-server
systemctl start rabbitmq-server

# Wait until RabbitMQ is fully started
echo "Waiting for RabbitMQ to start..."
until rabbitmqctl status 2>/dev/null | grep -q "running_applications"; do
    sleep 2
done

# Check if the user exists
rabbitmqctl list_users | grep -q roboshop
if [ $? -ne 0 ]; then
    echo "Adding RabbitMQ user..."
    rabbitmqctl add_user roboshop roboshop123
    echo "Setting permissions..."
    rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
else
    echo "User 'roboshop' already exists."
fi

# Keep the container running
tail -f /dev/null
