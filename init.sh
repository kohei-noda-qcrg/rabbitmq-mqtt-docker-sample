#!/usr/bin/env bash

set -eu

rabbitmqadmin declare queue name=test
rabbitmqadmin declare binding source=amq.topic destination=test routing_key=test.topic
