logstash-forwarder (a.k.a. lumberjack)
======================================

Build image
-----------

Copy the `logstash.crt` file to `certificates/` then start the docker build.

	docker build -t adinauer/logstash-forwarder .

Start container
---------------

Find the `logstash` container with `docker ps` and use the name or ID for the following command.

	docker run -d -v /home/vagrant/logtest/:/logs --link LOGSTASH_CONTAINER_ID:logstash adinauer/logstash-forwarder
