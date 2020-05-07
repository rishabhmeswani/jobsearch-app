# INFO 257 Jobsearch App Setup
The Jobsearch app is a Flask webapp connected to a MariaDB database. This repository contains two Dockerfiles that create a container for each that are then linked together. The MariaDB database is populated with the schema and data from the .sql file, and the Flask app is a collection of webpages powered by logic and routes in the python file.

### Create the MariaDB Container
1. Create the MariaDB container from the Dockerfile in /mariadb-docker by navigating to that folder and running the terminal commands:
  * `docker build -t mariadb-local .`
  * `docker run -d --name mariadb-jobsearch -p 3307:3306 -e MYSQL_ROOT_PASSWORD=mypass --mount type=volume,source=mysqlDB,target=/var/lib/mysql --mount type=bind,source="${PWD}"/datadir,target=/home/ --restart always mariadb-local`
  * Adjust the host's port from 3307 if it's already mapped to another server
  
### Create and Populate the Database
1. Connect to the MariaDB database to your database client using the credentials specified during the run command (default usename:password | root:mypass)
1. Run the jobsearch.sql file to create and populate the Jobsearching database
  
### Create the Flask Image and Network
1. Build the Flask image from the Dockerfile in the root directory by navigating to that folder and running the terminal command:
  * `docker build -t python-flask .`
1. Now that the containers for the Flask app and MariaDB database are created, a network is necessary for them to communicate. In terminal fun the following commands:
  * `docker network create --driver=bridge db-netwoork`
  * `docker network connect db-netwoork mariadb-jobsearch`
  
### Create and Use Jobsearch Webapp
1. With the network set up, run the following command in terminal to create the Flask container:
  * `docker run --name jobsearch-app -p 5000:5000 --mount type=bind,source="${PWD}"/webapp,target=/app --net db-netwoork python-flask`
1. Navigate to http://localhost:5000/ in your web browser to use the webapp
