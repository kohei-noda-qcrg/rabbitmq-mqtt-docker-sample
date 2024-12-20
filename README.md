# rabbitmq-mqtt-docker-sample

## setup instruction

```bash
# host machine
## TLS support
./build /path/to/certs && docker compose up -d
docker exec -it rabbitmqtt bash
## no-TLS
./build && docker compose up -d
docker exec -it rabbitmqtt bash

# container
/tmp/init.sh
```

- After the above steps, the payload can be pub/subbed using mqtt(s) on the test.topic topic.
- If you want to use self-signed certificate, you can easily generate it by the following commands.
  - tls-gen/basic/result/* are generated certificates
  ```bash
  git clone https://github.com/rabbitmq/tls-gen
  cd tls-gen/basic
  export CN=your_host_machine_address
  # no pasword
  make && make verify
  # with password
  make PASSWORD=your_password && make verify
  ```
