# How to run GG9 cluster in Docker on Arm architecture

1. Download the binary distribution and extract
```sh
unzip gridgain-9.0.0-beta1.zip
mv gridgain-db-9.0.0-beta1 dist/db
mv gridgain-cli-9.0.0-beta1 dist/cli
```
1. Copy JDBC library(optional)
```sh
cp ignite-jdbc-9.0.0-beta1.jar dist/db/lib
```
1. Build the Docker image
```sh
docker build -t gridgain/gridgain9:9.0.0-beta1 .
```
1. Run the Docker Compose script
```sh
docker-compose -f docker-compose.yml up -d
```
1. Initialise the cluster using cli
```bash
ignite3


           #              ___                         __
         ###             /   |   ____   ____ _ _____ / /_   ___
     #  #####           / /| |  / __ \ / __ `// ___// __ \ / _ \
   ###  ######         / ___ | / /_/ // /_/ // /__ / / / // ___/
  #####  #######      /_/  |_|/ .___/ \__,_/ \___//_/ /_/ \___/
  #######  ######            /_/
    ########  ####        ____               _  __           _____
   #  ########  ##       /  _/____ _ ____   (_)/ /_ ___     |__  /
  ####  #######  #       / / / __ `// __ \ / // __// _ \     /_ <
   #####  #####        _/ / / /_/ // / / // // /_ / ___/   ___/ /
     ####  ##         /___/ \__, //_/ /_//_/ \__/ \___/   /____/
       ##                  /____/

                      Apache Ignite CLI ver. 9.0.0-beta1


Do you want to reconnect to the last connected node http://localhost:10300? [Y/n] Y
Connected to http://localhost:10300
[node1]> cluster init --meta-storage-node node1 --meta-storage-node node2 --meta-storage-node node3 --cluster-name=TEST
Cluster was initialized successfully
[node1]> cluster topology physical
╔═══════╤══════════════╤══════╤═══════════════╤══════════════════════════════════════╗
║ name  │ host         │ port │ consistent id │ id                                   ║
╠═══════╪══════════════╪══════╪═══════════════╪══════════════════════════════════════╣
║ node1 │ 192.168.16.2 │ 3344 │ node1         │ ece7f0bf-37c1-433b-ab19-d7207302ffc6 ║
╟───────┼──────────────┼──────┼───────────────┼──────────────────────────────────────╢
║ node3 │ 192.168.16.3 │ 3344 │ node3         │ 5d550fd6-83e8-461c-a15b-07144d7c96bf ║
╟───────┼──────────────┼──────┼───────────────┼──────────────────────────────────────╢
║ node2 │ 192.168.16.4 │ 3344 │ node2         │ f06e6ed3-f37f-46e0-83bf-372690fe9ed9 ║
╚═══════╧══════════════╧══════╧═══════════════╧══════════════════════════════════════╝

```