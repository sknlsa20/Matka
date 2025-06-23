FROM openjdk:17-jdk-slim
   WORKDIR /app
   COPY . .
   RUN ./gradlew build  # or mvn package if using Maven
   EXPOSE 8080  # Replace with your application's port
   CMD ["java", "-jar", "build/libs/your-app.jar"] # Or your application's startup command
