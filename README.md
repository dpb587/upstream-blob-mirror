# upstream-blob-receipts

## Notes

    echo ~/Projects/dpb587/openvpn-bosh-release/src/blobs/openssl/pgp/*.asc | xargs -n1 gpg1 --no-default-keyring --keyring repos/openvpn/signature.gpg --import
    wget -qO- http://nginx.org/keys/is.key | bin/import-key nginx
