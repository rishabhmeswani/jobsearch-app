1. `docker build -t mariadb-local .`

2. `docker run -d --name mariadb-jobsearch -p 3307:3306 -e MYSQL_ROOT_PASSWORD=mypass --mount type=volume,source=mysqlDB,target=/var/lib/mysql --mount type=bind,source="${PWD}"/datadir,target=/home/ --restart always mariadb-local`