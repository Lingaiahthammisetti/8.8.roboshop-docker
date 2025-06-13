#!/bin/bash

echo "Setting permissions for user roboshop"
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
