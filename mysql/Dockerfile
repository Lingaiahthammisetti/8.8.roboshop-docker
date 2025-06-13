FROM mysql:8

# Set environment variables (avoid trailing spaces after backslashes)
ENV MYSQL_ROOT_PASSWORD=RoboShop@1 \
    MYSQL_DATABASE=cities \
    MYSQL_USER=shipping \
    MYSQL_PASSWORD=RoboShop@1

# Copy initialization scripts to be run on first container startup
COPY scripts/ /docker-entrypoint-initdb.d/
