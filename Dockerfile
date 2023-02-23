FROM golang:alpine as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o ./bin/rock

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/bin/rock .

ENTRYPOINT [ "./rock" ]