# Etapa de build
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

# Copia os arquivos essenciais do Maven
COPY pom.xml mvnw ./
COPY .mvn .mvn

# Dá permissão de execução ao Maven Wrapper
RUN chmod +x mvnw

# Copia o restante do código-fonte
COPY src src

# Compila o projeto (gera o target)
RUN ./mvnw clean package -DskipTests

# Etapa de execução
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

# Copia o jar compilado da etapa anterior
COPY --from=build /app/target/*-runner.jar app.jar

EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
