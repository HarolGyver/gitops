FROM golang:1.21.8-alpine3.20 AS builder

WORKDIR /app

COPY . .

RUN apk update && apk add --no-cache git && CGO_ENABLED=0 GOOS=linux go build -o server

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server .
RUN apk update && apk upgrade --no-cache
ENTRYPOINT [ "./server" ]
EXPOSE 8080