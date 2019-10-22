FROM alpine:latest

ENV OPENSSL_ROOT="/etc/openssl" \
    OPENSSL_CERTIFICATES="/certificates"

RUN set -ex; \
  # Install OpenSSL
  apk add --no-cache openssl; \
  # Prepare folders
  mkdir -p ${OPENSSL_ROOT} ${OPENSSL_CERTIFICATES}; \
  chgrp -R 0 ${OPENSSL_ROOT} ${OPENSSL_CERTIFICATES}; \
  chmod -R g+rwX ${OPENSSL_ROOT} ${OPENSSL_CERTIFICATES}

ENV OPENSSL_CERTIFICATE_EXPIRATION=3650 \
    OPENSSL_CERTIFICATE_HASH='sha512' \
    OPENSSL_CERTIFICATE_SUBJECT_COUNTRY='CO' \
    OPENSSL_CERTIFICATE_SUBJECT_STATE='ST' \
    OPENSSL_CERTIFICATE_SUBJECT_LOCATION='Location' \
    OPENSSL_CERTIFICATE_SUBJECT_ORGANIZATION='Organization' \
    OPENSSL_CERTIFICATE_SUBJECT_ORGANIZATION_UNIT='Organization unit' \
    OPENSSL_KEY_SIZE=4096 \
    OPENSSL_PRIVATE_KEY_ENCRYPTION='des3' \
    OPENSSL_PRIVATE_KEY_PASSWORD='' \
    SITE_DOMAIN='domain.test'

USER 1001

COPY config/openssl.cnf ${OPENSSL_ROOT}/openssl.cnf
COPY scripts/generate-certificates.sh ${OPENSSL_ROOT}/generate-certificates.sh

WORKDIR ${OPENSSL_CERTIFICATES}
VOLUME ${OPENSSL_CERTIFICATES}

ENTRYPOINT ["sh", "/etc/openssl/generate-certificates.sh"]
