# Etapa de build com Go + Alpine
FROM golang:1.21-alpine AS builder

# Instala git e outras dependências
RUN apk update && apk add --no-cache git

WORKDIR /app
COPY . .

# Compila o binário
RUN CGO_ENABLED=0 GOOS=linux go build -o server

# Etapa final com imagem enxuta
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/server .

CMD ["./server"]
