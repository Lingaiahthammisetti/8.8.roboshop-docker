# -------- Build Stage --------
FROM maven AS build

WORKDIR /opt/shipping

# Copy pom.xml and resolve dependencies first (to leverage Docker cache)
COPY pom.xml .
RUN mvn dependency:resolve

# Now copy the full source and build the app
COPY src ./src
RUN mvn package

# -------- Runtime Stage --------
FROM openjdk:8-jre-alpine3.9

# Set working directory and environment variables
WORKDIR /opt/shipping
ENV CART_ENDPOINT=cart:8080
ENV DB_HOST=mysql

# Expose service port
EXPOSE 8080

# Copy built JAR from build stage
COPY --from=build /opt/shipping/target/shipping-1.0.jar shipping.jar

# Copy wait-for-it script
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Wait for MySQL to be ready, then run the application
ENTRYPOINT ["/wait-for-it.sh", "mysql:3306", "--", "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar"]




# #Build

# FROM maven AS build

# WORKDIR /opt/shipping

# COPY pom.xml /opt/shipping/
# RUN mvn dependency:resolve
# COPY src /opt/shipping/src/
# RUN mvn package

# #
# # Run
# #
# FROM openjdk:8-jre-alpine3.9

# EXPOSE 8080

# WORKDIR /opt/shipping

# ENV CART_ENDPOINT=cart:8080
# ENV DB_HOST=mysql

# COPY --from=build /opt/shipping/target/shipping-1.0.jar shipping.jar

# CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]

# FROM maven AS build

# WORKDIR /opt/shipping

# COPY pom.xml /opt/shipping/
# RUN mvn dependency:resolve
# COPY src /opt/shipping/src/
# RUN mvn package
# RUN mv /opt/shipping/target/shipping-1.0.jar shipping.jar
# CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]


