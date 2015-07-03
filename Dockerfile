FROM elasticsearch:1.5
MAINTAINER Marty Zalega <marty.zalega@everydayhero.com>

RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.5.0
RUN /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/1.4.7
RUN /usr/share/elasticsearch/bin/plugin -install statsd -url https://github.com/nilsga/elasticsearch-statsd-plugin/releases/download/v0.4.1/elasticsearch-statsd-0.4.1.zip

# elasticsearch-statsd-plugin doesn't default the host and causes elasticsearch to fail because it's not defined
RUN echo "metrics.statsd.host: localhost" >> /usr/share/elasticsearch/config/elasticsearch.yml
