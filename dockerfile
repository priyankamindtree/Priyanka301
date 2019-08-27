FROM openjdk:8
COPY ./target/*.jar /opt/*.jar
ENTRYPOINT java -jar /opt/*.jar
EXPOSE 9090
