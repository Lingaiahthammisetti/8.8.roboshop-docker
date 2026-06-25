# Build stage
FROM maven:3.9.14 AS build
WORKDIR /opt/shipping
COPY pom.xml /opt/shipping/
# RUN mvn dependency:resolve
COPY src /opt/shipping/src/
RUN mvn clean package -DskipTests
# && mv target/shipping-1.0.jar shipping.jar

# Run stage
#FROM openjdk:8-jre-alpine3.9
FROM eclipse-temurin:17-jre-alpine
WORKDIR /opt/shipping
EXPOSE 8080
ENV CART_ENDPOINT=cart:8080
ENV DB_HOST=mysql
#COPY --from=build /opt/shipping/target/shipping-1.0.jar shipping.jar
COPY --from=build /opt/shipping/target/*.jar shipping.jar
CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]


# FROM maven AS build
# WORKDIR /opt/shipping
# COPY pom.xml /opt/shipping/
# RUN mvn dependency:resolve
# COPY src /opt/shipping/src/
# RUN mvn package
# RUN mv /opt/shipping/target/shipping-1.0.jar shipping.jar
# CMD [ "java", "-Xmn256m", "-Xmx768m", "-jar", "shipping.jar" ]