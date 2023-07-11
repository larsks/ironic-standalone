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
RUN pip install "flask<2.3"
RUN pip install \
	pymysql \
	ironic \
	ironic-inspector
RUN mkdir /tftpboot
COPY xinetd.d/tftp /etc/xinetd.d/tftp
