FROM rabbitmq:3-management

# Environment variables to auto-create user
ENV RABBITMQ_DEFAULT_USER=roboshop
ENV RABBITMQ_DEFAULT_PASS=roboshop123

# Copy setup script into container
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

# Run the setup script after container starts
CMD ["sh", "-c", "/setup.sh && rabbitmq-server"]
