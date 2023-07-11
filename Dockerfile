FROM docker.io/python:3.11

RUN apt update && \
	apt -y install \
		vim-tiny \
		less \
		dnsmasq \
		xinetd \
		tftpd-hpa \
		syslinux-common \
		pxelinux \
		iproute2 \
		ipmitool \
		&& \
	apt clean
RUN pip install ironic pymysql
RUN mkdir /tftpboot
COPY xinetd.d/tftp /etc/xinetd.d/tftp
