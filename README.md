# SSL Keygen

Generates self-signed certificates.

## Environment Variables

| Variable | Default Value
| --- | ---
| `OPENSSL_CERTIFICATE_EXPIRATION` | `3650`
| `OPENSSL_CERTIFICATE_HASH` | `sha512`
| `OPENSSL_CERTIFICATE_SUBJECT_COUNTRY` | `CO`
| `OPENSSL_CERTIFICATE_SUBJECT_STATE` | `ST`
| `OPENSSL_CERTIFICATE_SUBJECT_LOCATION` | `Location`
| `OPENSSL_CERTIFICATE_SUBJECT_ORGANIZATION` | `Organization`
| `OPENSSL_CERTIFICATE_SUBJECT_ORGANIZATION_UNIT` | `Organization unit`
| `OPENSSL_KEY_SIZE` | `4096`
| `OPENSSL_PRIVATE_KEY_ENCRYPTION` | `des3`
| `OPENSSL_PRIVATE_KEY_PASSWORD`
| `SITE_DOMAIN` | `domain.test`

## Usage example

```sh
docker run \
    --rm \
    -u `id -u` \
    -v /tmp/certificates:/certificates \
    -e OPENSSL_CERTIFICATE_SUBJECT_COUNTRY=CH \
    -e OPENSSL_CERTIFICATE_SUBJECT_STATE=FR \
    -e OPENSSL_CERTIFICATE_SUBJECT_LOCATION=Fribourg \
    -e OPENSSL_CERTIFICATE_SUBJECT_ORGANIZATION=Liip \
    -e OPENSSL_CERTIFICATE_SUBJECT_ORGANIZATION_UNIT=Docker \
    -e SITE_DOMAIN=liip.test \
    liip/ssl-keygen:1.0.0 \
    ls
```
