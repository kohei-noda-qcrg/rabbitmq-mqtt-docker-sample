# rabbitmq-mqtt-docker-sample

## setup instruction

```bash
# host machine
docker compose build && docker compose up -d
docker exec -it rabbitmqtt bash

# container
/tmp/init.sh
```

- After the above steps, the payload can be pub/subbed using mqtt on the test.topic topic.
- Authentication is not set, so it only works on the local host.
