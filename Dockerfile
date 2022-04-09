# syntax=docker/dockerfile:1
FROM golang:1.17-alpine
RUN apk add git chromium chromium-chromedriver

WORKDIR /app

COPY . ./
RUN go mod download

RUN go build -o /docker-gs-ping

ENV CGO_ENABLED=0

CMD [ "/docker-gs-ping" ]
