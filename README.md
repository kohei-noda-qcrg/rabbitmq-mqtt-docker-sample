# rabbitmq-mqtt-docker-sample

## setup instruction

```bash
# host machine
## TLS support
### cert files must be named as following (if you don't want to follow this, you can edit rabbitmq.conf manually to change this behavior)
### - ca cert file:     /path/to/certs/ca_certificate.pem
### - server cert file: /path/to/certs/server_certificate.pem
### - server key file:  /path/to/certs/server_key.pem
./build.sh /path/to/certs && docker compose up -d
docker exec -it rabbitmqtt bash
## no-TLS
./build.sh && docker compose up -d
docker exec -it rabbitmqtt bash

# container
/tmp/init.sh
```

- After the above steps, the payload can be pub/subbed using mqtt(s) on the test.topic topic.
- If you want to use self-signed certificate, you can easily generate it by the following commands.
  - tls-gen/basic/result/\* are generated certificates
  ```bash
  git clone https://github.com/rabbitmq/tls-gen
  cd tls-gen/basic
  export CN=your_host_machine_address
  # no pasword
  make && make verify
  # with password
  make PASSWORD=your_password && make verify

  # rename the generated files
  cd result
  mv server_${CN}_certificate.pem server_certificate.pem
  mv server_${CN}_key.pem server_key.pem
  ```
