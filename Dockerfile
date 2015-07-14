FROM elasticsearch:1.5
MAINTAINER Marty Zalega <marty.zalega@everydayhero.com>

ENV CLOUD_AWS_VERSION 2.5.0
ENV KOPF_VERSION 1.4.7
ENV STATSD_VERSION 0.4.1
ENV LICENSE_VERSION latest
ENV WATCHER_VERSION latest

RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/${CLOUD_AWS_VERSION}
RUN /usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/${KOPF_VERSION}
RUN /usr/share/elasticsearch/bin/plugin -install statsd -url https://github.com/nilsga/elasticsearch-statsd-plugin/releases/download/v${STATSD_VERSION}/elasticsearch-statsd-${STATSD_VERSION}.zip
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/license/${LICENSE_VERSION}
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/watcher/${WATCHER_VERSION}

# elasticsearch-statsd-plugin doesn't default the host and causes elasticsearch to fail because it's not defined
RUN echo "metrics.statsd.host: localhost" >> /usr/share/elasticsearch/config/elasticsearch.yml
