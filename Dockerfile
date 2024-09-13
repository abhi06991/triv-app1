FROM eclipse-temurin:22.0.2_9-jdk-alpine

COPY AppOne.java /usr/src/triv-app1/

WORKDIR /usr/src/triv-app1

RUN javac AppOne.java

CMD ["sh", "-c", "java AppOne && tail -f /dev/null"]
