# syntax=docker/dockerfile:1
FROM golang:1.17-alpine
RUN apk add git chromium chromium-chromedriver

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /docker-gs-ping

ENV CGO_ENABLED=0

CMD [ "/docker-gs-ping" ]

