# How to run GG9 cluster in Docker on Arm architecture

1. Download the binary distribution and extract
```sh
unzip gridgain-9.0.0-beta1.zip
mv gridgain-db-9.0.0-beta1 dist/db
mv gridgain-cli-9.0.0-beta1 dist/cli
```
1. Build the Docker image
```sh
docker build -t gridgain/gridgain9:9.0.0-beta1 .
```
1. Run the Docker Compose script
```sh
docker-compose -f docker-compose.yml up -d
```