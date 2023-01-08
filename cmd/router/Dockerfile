FROM registry.access.redhat.com/ubi8-minimal

ENV BUILD_NAME svc

# see https://caddyserver.com/docs/conventions#file-locations for details
ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data

EXPOSE 80
EXPOSE 443
EXPOSE 2019

# create the data and config locations
RUN set -eux; \
	mkdir -p \
		/config/caddy \
		/data/caddy \
		/etc/caddy

VOLUME /config
VOLUME /data

# see https://github.com/lucas-clemente/quic-go/wiki/UDP-Receive-Buffer-Size
# sysctl -w net.core.rmem_max=2500000
# RUN echo "2500000" > /proc/sys/net/core/rmem_max

# copy the binary
COPY $BUILD_NAME /usr/bin/svc

# ... and make it executable
RUN chmod +x /usr/bin/svc

#USER 1001
ENTRYPOINT ["/usr/bin/svc","run","--config","/config/Caddyfile","--adapter","caddyfile"]