FROM node:14-alpine

RUN apk add --no-cache bash curl

# Create a vulnerable application (example)
RUN curl -LO https://example.com/vulnerable-software.tar.gz && \
    tar -xzf vulnerable-software.tar.gz && \
    cd vulnerable-software && \
    ./install.sh

COPY AppOne.java /usr/src/triv-app1/

WORKDIR /usr/src/triv-app1

RUN javac AppOne.java

CMD ["sh", "-c", "java AppOne && tail -f /dev/null"]
