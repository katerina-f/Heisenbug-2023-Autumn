#!/bin/sh

mkdir -p /etc/kafka/secrets \
&& cp /kafka_server_jaas.conf /etc/kafka/secrets/ \
&& sed -i "s/\${DOCKER_TEST_KAFKA_PASS}/$DOCKER_TEST_KAFKA_PASS/g" /etc/kafka/secrets/kafka_server_jaas.conf \
&& sed -i "s/\${DOCKER_TEST_KAFKA_USER}/$DOCKER_TEST_KAFKA_USER/g" /etc/kafka/secrets/kafka_server_jaas.conf \
&& /etc/confluent/docker/run
