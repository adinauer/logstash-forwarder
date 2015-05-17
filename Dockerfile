FROM golang:1.4
MAINTAINER Alexander Dinauer <alexander@dinauer.at>

RUN git clone git://github.com/elasticsearch/logstash-forwarder.git /tmp/logstash-forwarder && \
		cd /tmp/logstash-forwarder && \
		go build -o /opt/logstash-forwarder/bin/logstash-forwarder && \
		rm -rf /tmp/logstash-forwarder

# ADD certificates/logstash.key /opt/logstash-forwarder/certs/logstash.key
ADD certificates/logstash.crt /opt/logstash-forwarder/certs/logstash.crt

ADD config/logstash-forwarder.conf /opt/logstash-forwarder/logstash-forwarder.conf

CMD /opt/logstash-forwarder/bin/logstash-forwarder -config /opt/logstash-forwarder/logstash-forwarder.conf