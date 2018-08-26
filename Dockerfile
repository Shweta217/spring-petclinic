FROM openjdk:8-jdk-alpine
RUN curl -fsSLO https://get.docker/builds/Linux/x86_64/docker_18.06.1-ce.tgz && tar xzvf docker_18.06.1-ce.tgz && mv docker/docker  /usr/local/bin && rm -r docker docker_18.06.1-ce.tgz



LABEL maintainer="mrcool435@gmail.com"
COPY /target/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar
CMD ["java","-jar","/home/spring-petclinic-2.0.0.BUILD-SNAPSHOT.jar"]
