FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git . && \
    mvn clean package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/spring-petclinic-*.jar app.jar

ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar /app/otel-agent.jar

EXPOSE 8080

ENTRYPOINT ["java", "-javaagent:/app/otel-agent.jar", "-jar", "/app/app.jar"]
