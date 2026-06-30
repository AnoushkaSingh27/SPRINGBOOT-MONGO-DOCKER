#stage 1
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#stage 2
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

RUN addgroup --system appgroup && \
    adduser --system --ingroup appgroup appuser

USER appuser
ENTRYPOINT ["java","-jar","app.jar"]