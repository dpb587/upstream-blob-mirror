# upstream-blob-mirror

## Notes

    echo ~/Projects/dpb587/openvpn-bosh-release/src/blobs/openssl/pgp/*.asc | xargs -n1 -I{} bash -c 'cat {} | bin/import-key openssl'
    wget -qO- http://nginx.org/keys/is.key | bin/import-key nginx
    version=3421.3 bin/watch "$S3_BLOBS" repository/bosh.io/stemcell/bosh-warden-boshlite-ubuntu-trusty-go_agent
    docker run -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e S3_BLOBS -e S3_REPOS_BUCKET -e GIT_AUTHOR_NAME -e GIT_AUTHOR_EMAIL -e GIT_COMMITTER_NAME -e GIT_COMMITTER_EMAIL --rm -t -i --workdir=/tmp/build -v $PWD:/tmp/build dpb587/upstream-blob-receipts
    fly -t dpb587-nightwatch-aws-use1 sp -p dpb587:upstream-blob-receipts -c ci/pipeline.yml -v aws_access_key_id="$AWS_ACCESS_KEY_ID" -v aws_secret_access_key="$AWS_SECRET_ACCESS_KEY" -v s3_blobs="$S3_BLOBS" -v s3_repos_bucket="$S3_REPOS_BUCKET" -v git_private_key="$GIT_PRIVATE_KEY"
