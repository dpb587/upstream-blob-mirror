FROM alpine:3.4
RUN apk --no-cache add bash ca-certificates curl git && update-ca-certificates
RUN \
  curl -sLo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
  && echo 'c6b3a7d7d3e7b70c6f51b706a3b90bd01833846c54d32ca32f0027f00226ff6d  /usr/local/bin/jq' | sha256sum -c \
  && chmod +x /usr/local/bin/jq
RUN \
  curl -sLo /usr/local/bin/mc https://dl.minio.io/client/mc/release/linux-amd64/archive/mc.RELEASE.2017-02-06T20-16-19Z \
  && echo 'f9df4976c2af5cdb56448df9efa7ef20c76f49e1e3fdf0ddfb5c668b55227a56  /usr/local/bin/mc' | sha256sum -c \
  && chmod +x /usr/local/bin/mc
ADD meta4 /usr/local/bin/meta4
ADD meta4-repo /usr/local/bin/meta4-repo
