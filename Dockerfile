FROM golang:1.21 as builder

ADD . /github-release-notifier
WORKDIR /github-releases-notifier

RUN make build

FROM alpine:3.19
RUN apk --no-cache add ca-certificates

COPY --from=builder /github-releases-notifier/github-release-notifier /usr/bin/
ENTRYPOINT ["github-releases-notifier"]
