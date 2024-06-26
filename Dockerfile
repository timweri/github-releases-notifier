FROM golang:1.21 as builder

ADD . /go/src/github.com/justwatchcom/github-releases-notifier
WORKDIR /go/src/github.com/justwatchcom/github-releases-notifier

RUN make build

FROM alpine:3.19
RUN apk --no-cache add ca-certificates

COPY --from=builder /go/src/github.com/justwatchcom/github-releases-notifier /usr/bin/
ENTRYPOINT ["github-releases-notifier"]
