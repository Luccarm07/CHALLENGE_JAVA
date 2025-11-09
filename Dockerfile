# Etapa 1: build com Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copia wrapper e arquivos Maven
COPY pom.xml mvnw ./
COPY .mvn .mvn
RUN chmod +x mvnw

# Copia código-fonte
COPY src src

# Compila o projeto
RUN ./mvnw package -DskipTests -Dquarkus.package.type=fast-jar

# Etapa 2: runtime
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

COPY --from=build /app/target/quarkus-app /app/

CMD ["java", "-jar", "/app/quarkus-run.jar"]
