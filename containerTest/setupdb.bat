docker run --rm -d --name postgresdb -v "%cd%\data":/docker-entrypoint-initdb.d/ -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres