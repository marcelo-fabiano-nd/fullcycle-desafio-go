FROM golang:1.7.3 AS builder
WORKDIR /app
COPY /src/main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main

FROM scratch AS app
WORKDIR /app
COPY --from=builder /app/main .
CMD [ "./main" ]