1. `docker build -t python-flask .`
2. `docker network create --driver=bridge db-netwoork`
3. `docker network connect db-netwoork mariadb-jobsearch`
4. `docker run --name jobsearch-app -p 5000:5000 --mount type=bind,source="${PWD}"/webapp,target=/app --net db-netwoork python-flask`