FROM registry.ci.openshift.org/openshift/release:rhel-8-release-golang-1.23-openshift-4.19 as builder
WORKDIR /go/src/github.com/jbpratt/hello-world/
COPY . .
RUN go build -o /hello-world .

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
COPY --from=builder /hello-world .
ENTRYPOINT [ "/hello-world" ]
