FROM openjdk:17-jdk-slim
   WORKDIR /app
   COPY . .
   RUN ./gradlew build  # or mvn package if using Maven
   EXPOSE 8080 
   CMD ["java", "-jar", "build/libs/MatkaMain.jar"]
