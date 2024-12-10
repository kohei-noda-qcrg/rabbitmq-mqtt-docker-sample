#!/usr/bin/env bash

set -eu

rabbitmqadmin declare queue name=test
rabbitmqadmin declare binding source=amq.topic destination=test routing_key=test.topic

# add non-guest user
MQTT_USER="mqtt-test"
rabbitmqctl add_user $MQTT_USER $MQTT_USER
rabbitmqctl set_permission -p "/" $MQTT_USER ".*" ".*" ".*"
rabbitmqctl set_user_tags management
