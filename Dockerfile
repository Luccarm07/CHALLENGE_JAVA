FROM eclipse-temurin:17
# Use a versão JRE se quiser uma imagem final menor (opcional)
# FROM eclipse-temurin:17-jre-focal

WORKDIR /app

# 1. Copia arquivos de configuração e wrapper
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# 2. Copia o código-fonte
COPY src src

# Garante permissão e executa o build
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# Configura a porta
EXPOSE 8080

# Comando final de execução: o caminho está ajustado para o WORKDIR
CMD ["java", "-jar", "target/quarkus-app/quarkus-run.jar"]