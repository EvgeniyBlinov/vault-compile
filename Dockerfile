# vim: set noet ci pi sts=0 sw=4 ts=4 :
FROM golang:latest

RUN set -ex \
	&& mkdir -p $GOPATH/src/github.com/hashicorp \
	&& cd $GOPATH/src/github.com/hashicorp \
	&& git clone https://github.com/hashicorp/vault.git

ARG VAULT_VERSION=master
ENV VAULT_VERSION ${VAULT_VERSION}

RUN set -ex; \
	cd $GOPATH/src/github.com/hashicorp/vault \
	&& git checkout ${VAULT_VERSION} \
	&& make bootstrap \
	&& make dev

CMD ["tail", "-f", "/dev/null"]
