# tidb-playground
Dockerfile for tidb playground using tiup

The image is available at https://hub.docker.com/r/tigrulya/tidb-playground

## Usage

### Start container

``` bash
docker run -d -p 4000:4000 -p 2379:2379 tigrulya/tidb-playground:v6.0.0
```

After few seconds we can check the logs of the container to make sure our TiDB cluster is up and running.

![check-logs](./images/logs.png)

### Access TiDB

Using the database cli to access TiDB.

![cli](./images/cli.png)

### Access TiDB dashboard

Go to `localhost:2379/dashboard` to access TiDB dashboard.

![dashboard](./images/dashboard.png)
