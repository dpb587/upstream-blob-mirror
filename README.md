# upstream-blob-mirror

## Notes

    echo ~/Projects/dpb587/openvpn-bosh-release/src/blobs/openssl/pgp/*.asc | xargs -n1 -I{} bash -c 'cat {} | bin/import-key openssl'
    wget -qO- http://nginx.org/keys/is.key | bin/import-key nginx
    docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e S3_BLOBS -e S3_REPOS_BUCKET -e GIT_AUTHOR_NAME -e GIT_AUTHOR_EMAIL -e GIT_COMMITTER_NAME -e GIT_COMMITTER_EMAIL --rm -t -i --workdir=/tmp/build -v $PWD:/tmp/build dpb587/upstream-blob-receipts
