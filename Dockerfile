#build stage
ARG BASE_GIT_REPO_URL=https://github.com/mongodb/mongo-tools.git
ARG GIT_COMMIT_HASH=df997aa
FROM golang:alpine AS builder
RUN apk add --no-cache git bash gcc libc-dev openssl-dev cyrus-sasl-dev krb5-dev
WORKDIR /go/src/app
RUN git clone ${BASE_GIT_REPO_URL} .
RUN git checkout ${GIT_COMMIT_HASH}
# RUN ./build.sh ssl sasl
RUN ./make build

#final stage
FROM alpine
RUN apk --no-cache add ca-certificates
RUN apk add --no-cache openssl cyrus-sasl krb5
COPY --from=builder /go/src/app/bin /mongo-tools
WORKDIR /mongo-tools
RUN ./mongoimport --version
LABEL Name=mongo-tools

# debian version
# this works with the forked build script
# FROM golang
# RUN apt-get update
# RUN apt-get install libssl-dev libsasl2-dev -y
# WORKDIR /go/src/app
# RUN git clone https://github.com/calebHankins/mongo-tools.git .
# RUN ./build.sh ssl sasl
