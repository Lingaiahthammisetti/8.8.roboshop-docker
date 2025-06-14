#!/bin/bash

# Start RabbitMQ app if not running
rabbitmqctl start_app

# Set permissions for user roboshop on the default vhost "/"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"