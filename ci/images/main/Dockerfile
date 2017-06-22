FROM alpine:3.4
RUN apk --no-cache add bash ca-certificates coreutils curl git gnupg openssl
RUN \
  curl -sLo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
  && echo 'c6b3a7d7d3e7b70c6f51b706a3b90bd01833846c54d32ca32f0027f00226ff6d  /usr/local/bin/jq' | sha256sum -c \
  && chmod +x /usr/local/bin/jq
ADD meta4 /usr/local/bin/meta4
ADD meta4-repo /usr/local/bin/meta4-repo
