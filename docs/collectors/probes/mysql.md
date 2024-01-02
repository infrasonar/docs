![MySQL](../../images/probe_mysql.png){ width="150" align=right}

# MySQL

## Introduction

The MySQL probe collects information about a MySQL server.

## Deployment

The MySQL probe can easily be deployed using our [appliance manager](./appliance/appliance_manager.md).

## Probe configuration

!!! tip "Make sure your MySQL server is accessible"
    You can edit the files in /etc/mysql/ to configure the basic settings – log file, port number, etc. For example, to configure MySQL to listen for connections from network hosts, in the file /etc/mysql/mysql.conf.d/mysqld.cnf, change the bind-address directive to the server’s IP address:

        bind-address            = 0.0.0.0

Create an `infrasonar` user and provide the required privileges:

    CREATE USER 'infrasonar' IDENTIFIED BY '<MY_SECRET_PASSWORD>';
    GRANT SELECT, PROCESS, REFERENCES on *.* TO 'infrasonar';

Add the username and password to your configuration file _(`INFRASONAR_CONF` yaml)_:

```yaml
mysql:
  config:
     username: infrasonar
     password: <MY_SECRET_PASSWORD>
```

## Additional information

:material-github: [MySQL probe source code](https://github.com/infrasonar/mysql-probe)
