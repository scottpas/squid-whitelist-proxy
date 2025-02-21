FROM alpine:3.10

RUN apk add squid && \
    mkdir -p /squid/var/cache/squid && \
    chown -R squid /squid

COPY entrypoint.sh /entrypoint.sh
COPY squid.conf /etc/squid/
COPY sites.whitelist.txt /etc/squid/

RUN chmod +x ./entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["./entrypoint.sh"]
CMD ["-NCd", "1", "-f", "/squid/config/squid.conf" ]

USER squid