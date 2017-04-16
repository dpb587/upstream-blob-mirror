# upstream-blob-mirror

## Notes

    echo ~/Projects/dpb587/openvpn-bosh-release/src/blobs/openssl/pgp/*.asc | xargs -n1 -I{} bash -c 'cat {} | bin/import-key openssl'
    wget -qO- http://nginx.org/keys/is.key | bin/import-key nginx
