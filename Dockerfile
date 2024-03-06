ARG VERSION=2.6.1

FROM paperlessngx/paperless-ngx:${VERSION}

RUN set -eux \
  echo "Installing system packages" \
    && apt-get update \
    && apt-get install -y --no-install-recommends patch redis \
    && rm --recursive --force --verbose /var/lib/apt/lists/*

COPY docker-prepare.sh.diff /tmp/docker-prepare.sh.diff
RUN set -eux \
  echo "Patching docker-prepare.sh" \
    && patch /sbin/docker-prepare.sh /tmp/docker-prepare.sh.diff \
    && rm /tmp/docker-prepare.sh.diff
