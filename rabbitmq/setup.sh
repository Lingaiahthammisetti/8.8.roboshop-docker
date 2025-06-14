#!/bin/bash

# Wait for RabbitMQ to be ready
sleep 10

# Check if user exists
rabbitmqctl list_users | grep roboshop > /dev/null
if [ $? -ne 0 ]; then
    echo "Adding RabbitMQ user"
    rabbitmqctl add_user roboshop roboshop123
    rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
    echo "Setting permissions for roboshop"
else
    echo "User 'roboshop' already exists."
fi
