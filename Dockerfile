# Use Eclipse Temurin JDK 25 with Maven for building
FROM eclipse-temurin:25-jdk-noble AS build

RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy Maven files for dependency resolution
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use Eclipse Temurin JRE 25 for the final image
FROM eclipse-temurin:25-jre-noble

WORKDIR /app

# Copy the built jar file
COPY --from=build /app/target/photo-album-*.jar app.jar

# Expose port
EXPOSE 8080

# Set JVM options for container environment
ENV JAVA_OPTS="-Xmx512m -Xms256m"

# Run the application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]