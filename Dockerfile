FROM golang:1.4
MAINTAINER Alexander Dinauer <alexander@dinauer.at>

RUN git clone git://github.com/elasticsearch/logstash-forwarder.git /tmp/logstash-forwarder && \
		cd /tmp/logstash-forwarder && \
		go build -o /opt/logstash-forwarder/bin/logstash-forwarder && \
		rm -rf /tmp/logstash-forwarder

CMD /opt/logstash-forwarder/bin/logstash-forwarder -config /opt/logstash-forwarder/config/logstash-forwarder.conf