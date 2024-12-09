FROM rabbitmq:4.0.4-management

COPY init.sh /tmp
RUN rabbitmq-plugins enable rabbitmq_mqtt
