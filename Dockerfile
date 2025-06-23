# Use Maven with OpenJDK
FROM maven:3.8.6-openjdk-17 AS build

# Set work directory
WORKDIR /app

# Copy project files
COPY . .

# Build the project
RUN mvn clean package -DskipTests

# Second stage - smaller image just to run the app
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy built JAR from previous stage
COPY --from=build /app/target/*.jar app.jar

# Run the app
CMD ["java", "-jar", "app.jar"]
