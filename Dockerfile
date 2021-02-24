FROM openjdk:12-jdk-alpine
COPY FirstWebApp.jar FirstWebApp.jar
CMD ["java","-jar","FirstWebApp.jar"]