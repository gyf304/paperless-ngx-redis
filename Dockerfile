FROM paperlessngx/paperless-ngx:2.6

RUN set -eux \
  echo "Installing system packages" \
    && apt-get update \
    && apt-get install -y --no-install-recommends redis \
    && rm --recursive --force --verbose /var/lib/apt/lists/*

COPY start-redis.sh /custom-cont-init.d/start-redis.sh
RUN chmod +x /custom-cont-init.d/start-redis.sh
