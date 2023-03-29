FROM bitnami/minideb:buster

RUN install_packages curl ca-certificates

ARG TIDB_VERSION=v6.1.0
ENV TIDB_VERSION=${TIDB_VERSION}

RUN  curl --proto '=https' --tlsv1.2 -sSf https://tiup-mirrors.pingcap.com/install.sh | sh && ln -s /root/.tiup/bin/tiup /bin/tiup

RUN tiup install tidb:${TIDB_VERSION} pd:${TIDB_VERSION} tikv:${TIDB_VERSION} playground
COPY config.toml /root/.tiup/config.toml
CMD tiup playground --without-monitor ${TIDB_VERSION} --db.host 0.0.0.0 --pd.host 0.0.0.0 --host 0.0.0.0 --tiflash 0 --db.config /root/.tiup/config.toml
