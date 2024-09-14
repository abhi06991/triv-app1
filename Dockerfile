FROM node:14-alpine

RUN apk add --no-cache bash curl

COPY AppOne.java /usr/src/triv-app1/

WORKDIR /usr/src/triv-app1

RUN javac AppOne.java

CMD ["sh", "-c", "java AppOne && tail -f /dev/null"]
