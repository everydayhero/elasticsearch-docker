FROM elasticsearch:1.5
MAINTAINER Marty Zalega <marty.zalega@everydayhero.com>

ENV CLOUD_AWS_VERSION 2.5.0
ENV KOPF_VERSION 1.4.7

RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/${CLOUD_AWS_VERSION}
RUN /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/${KOPF_VERSION}
