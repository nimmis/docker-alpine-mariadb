## MariaDB 10 server on Alpine

[![Docker Hub; nimmis/alpine-mariadb](https://images.microbadger.com/badges/image/nimmis/alpine-mariadb.svg)](https://registry.hub.docker.com/u/nimmis/alpine-mariadb)

## What is MariaDB?

MariaDB is a community-developed fork of the MySQL relational database management system intended to remain free under the GNU GPL.


Container based on **nimmis/alpine-micro** [![Docker Hub; nimmis/alpine-micro](https://images.microbadger.com/badges/image/nimmis/alpine-micro.svg)](https://registry.hub.docker.com/u/nimmis/alpine-micro), a minimal os (8.5 Mb)  with working init process and syslog. For more information on how to set upp services, please read the dockumentation for [nimmis/alpine-micro](https://registry.hub.docker.com/u/nimmis/alpine-micro). This container is about half the size of the official mariadb docker container.


## Starting the container

To run the lastest stable version of this docker image run

	docker run -d -e MARIADB_RANDOM_ROOT_PASSWORD=yes nimmis/alpine-mariadb

to expose the database to the external interface run

	docker run -d -p 3306:3306 e MARIADB_RANDOM_ROOT_PASSWORD=yes nimmis/alpine-mariadb

## Environment variables used in the container

### MARIADB_ROOT_PASSWORD
This variable defines the password for the root user in the database, se it with

	-e MARIADB_ROOT_PASSWORD=secretpassword

add quotes if there is spaces or other special character in the passwordd

	-e MARIADB_ROOT_PASSWORD='password with spaces'

### MARIADB_RANDOM_ROOT_PASSWORD
This variable generate a random password for the root user, add 

	-e MARIADB_RANDOM_ROOT_PASSWORD=yes

the password can then be found by looking at the logoutput

	docker logs <container>

### MARIADB_ALLOW_EMPTY_PASSWORD
This allowes the root password to be blank, THIS IS A MAJOR SECURITY RISK, add

	-e MARIADB_ALLOW_EMPTY_PASSWORD=yes

### MARIADB_REMOTE_ROOT
Normal the root user can only use localhost to access the databases adding

	-e MARIADB_REMOTE_ROOT=yes

allows root access from any host

### MARIADB_DATABASE
creates a database with the defined name

	-e MARIADB_DATABASE=databasename

### MARIADB_USER
creates a user with password defined with MARIADB_PASSWORD and full access to the database defined by MARIADB_DATABASE

	-e MARIADB_USER=username

### MARIADB_PASSWORD
The apssword for the user defined by MARIADB_USER

	-e MARIADB_PASSWORD=donottell


### MARIADB_PASSWORD

## Volumes

The /data volume is defined containing

### /data/conf

Contains the configuration of mariadb (**my.cnf**)

### /data/db

Contains the database files

### /data/logs

Contains logs from mariadb
