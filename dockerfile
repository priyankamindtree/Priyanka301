FROM openjdk:8
COPY ./target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /opt/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar
ENTRYPOINT java -jar /opt/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar
EXPOSE 9090
