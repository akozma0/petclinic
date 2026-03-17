FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git . && \
    mvn clean package -DskipTests

# Run with OTEL
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-*.jar app.jar
# Download OTEL
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar otel-agent.jar

EXPOSE 8080

# For compose env injection
ENTRYPOINT ["java", "-javaagent:/app/otel-agent.jar", "-jar", "/app/app.jar"]
