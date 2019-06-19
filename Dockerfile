# vim: set noet ci pi sts=0 sw=4 ts=4 :
FROM golang:latest

RUN set -ex \
	&& mkdir -p $GOPATH/src/github.com/hashicorp && cd $_ \
	&& git clone https://github.com/hashicorp/vault.git \
	&& cd vault \
	&& make bootstrap \
	&& make dev

CMD ["tail", "-f", "/dev/null"]
