FROM larsks/f21base

RUN yum -y install \
	openssh-clients; \
	yum clean all

COPY start.sh /start.sh
RUN chmod 755 /start.sh
CMD ["/start.sh"]
