FROM denoland/deno:1.29.1 as base
ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo"
RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY ./container/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
