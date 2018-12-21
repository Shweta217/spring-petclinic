FROM openjdk:8-jdk-alpine
LABEL maintainer="shweta.idk@gmail.com"
COPY /target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar
CMD ["java","-jar","/home/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
