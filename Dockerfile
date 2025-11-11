FROM tarampampam/3proxy:latest

COPY 3proxy.cfg.tpl /etc/3proxy/3proxy.cfg.tpl
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
