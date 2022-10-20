## Management

### Manual update

Manually downloading new container images can be done using the following two commands:

```bash
/usr/local/bin/docker-compose -f /etc/infrasonar/docker-compose.yml pull
/usr/local/bin/docker-compose -f /etc/infrasonar/docker-compose.yml up -d
```

### Restarting InfraSonar

```bash
/usr/local/bin/docker-compose -f /etc/infrasonar/docker-compose.yml restart
```