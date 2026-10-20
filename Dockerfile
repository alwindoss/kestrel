# https://github.com/GoogleContainerTools/distroless
FROM golang:1.27.3 AS builder
WORKDIR /go/src/app
COPY . .
RUN make setup
RUN make docker

FROM gcr.io/distroless/static-debian13
WORKDIR /root/
COPY --from=builder /go/src/app/bin/kestrel .
CMD [ "./kestrel" ]