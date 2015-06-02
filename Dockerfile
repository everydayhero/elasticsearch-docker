FROM elasticsearch:1.5
MAINTAINER Marty Zalega <marty.zalega@everydayhero.com>

RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.5.0
RUN /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/1.4.7
