FROM golang:1.21-alpine3.18 AS builder

WORKDIR /app

COPY go.mod go.sum ./
COPY main.go ./

# RUN CGO_ENABLED=1 go build -o main ./...
RUN go build -o main ./...


FROM alpine:3.18 as runner

WORKDIR /app

COPY --from=builder /app/main .
COPY templates templates
COPY public public

ENV PORT=3000 INSTANCE_NAME="dov-bear" INSTANCE_HASH="red"

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -X GET -sf http://localhost:${PORT}/healthz > /dev/null || exit 1

ENTRYPOINT /app/main