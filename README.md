# Desafio Fullcycle Go

O desafio consiste em criar uma aplicação *Go* que realiza um *print* de texto na tela com a mensagem ***"Fullcycle Rocks"*** sendo executada numa imagem *Docker* com menos de 2 Mb.

## Criando a imagem para executar o container

Foi criado dentro do projeto um arquivo  `Dockerfile`  contendo o passo-a-passo (receita de bolo) de criação da imagem  _Docker_  que posteriormente será utilizada para execução da aplicação em um container.

    FROM golang:1.7.3 AS builder
    WORKDIR /app
    COPY /src/main.go .
    RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main
    
    FROM scratch AS app
    WORKDIR /app
    COPY --from=builder /app/main .
    CMD [ "./main" ]

> Para conseguir cumprir o desafio foi utilizada uma imagem chamada scratch que nada mais é que uma imagem super enxuta para ser utilizada em aplicações binárias de execução simples como a do desafio