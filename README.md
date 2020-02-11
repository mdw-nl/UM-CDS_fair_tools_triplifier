# Triplifier

This repository creates the tooling project for the Triplifier.

## Prerequisites

This tool can be executed in two modes:

* Stand-alone java runnable jar
* Docker container (and service) mode

For the runnable jar, it needs a computer with [Java 8 runtime](oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html) installed.
For the docker container, it needs [Docker Community Edition](https://www.docker.com/community-edition) (native on Ubuntu, "for Windows" or "for Mac").

## Run as Java command-line tool

The basic configuration can run with the following command:

```
java -jar triplifier.jar -p triplifier.properties
```

The properties file mentioned here contains the JDBC connection information, several examples are displayed below, for different database systems.

**PostgreSQL**
```
jdbc.url = jdbc:postgresql://localhost/my_database
jdbc.user = postgres
jdbc.password = postgres
jdbc.driver = org.postgresql.Driver
```

**MySQL**
```
jdbc.url = jdbc:mysql://localhost/my_database
jdbc.user = user
jdbc.password = pass
jdbc.driver = com.mysql.cj.jdbc.Driver
```

**Microsoft SQL Server**
```
jdbc.url = jdbc:sqlserver://localhost;databaseName=my_database
jdbc.user = my_username
jdbc.password = my_password
jdbc.driver = com.microsoft.sqlserver.jdbc.SQLServerDriver
```

**Folder with CSV files**
```
jdbc.url = jdbc:relique:csv:C:\\Users\\johan\\test?fileExtension=.csv
jdbc.user = "user"
jdbc.password = "pass"
jdbc.driver = org.relique.jdbc.csv.CsvDriver
```

### Optional arguments

By default, the tool will generate an ontology file (ontology.owl) and a turtle file containing the materialized triples (output.ttl) relative to the execution folder. To change this, the following additional arguments can be used:

* -o <output_path_for_materialized_triples_file>
* -t <output_path_for_ontology_file>

## Run as Docker container

To run the triplifier as Docker container, you can run the following command:

**On Linux/Unix/macOS systems:**
 ```
docker run --rm \
    -e DB_JDBC="jdbc:sqlserver://localhost;databaseName=my_database" \
    -e DB_USER=my_username \
    -e DB_PASS=my_password \
    -e DB_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver \
    -v $(pwd)/output.ttl:/output.ttl \
    -v $(pwd)/ontology.owl:/ontology.owl \
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 **On windows systems:**
 ```
docker run --rm ^
    -e DB_JDBC="jdbc:sqlserver://localhost;databaseName=my_database" ^
    -e DB_USER=my_username ^
    -e DB_PASS=my_password ^
    -e DB_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver ^
    -v %cd%/output.ttl:/output.ttl ^
    -v %cd%/ontology.owl:/ontology.owl ^
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 The DB_JDBC/DB_USER/DB_PASS/DB_DRIVER variables are equivalent to the java properties file described above.

 ### Run as a service

 The example below shows how to run the container as a service, where the materialization process is called every interval time (defined by `SLEEPTIME` in seconds).

#### SQL Server example
 ```
docker run --rm \
    -e DB_JDBC="jdbc:sqlserver://localhost;databaseName=my_database" \
    -e DB_USER=my_username \
    -e DB_PASS=my_password \
    -e DB_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver \
    -e SLEEPTIME=10 \
    -e OUTPUT_ENDPOINT="http://graphdb:7200/repositories/sage" \
    --link graphdb:graphdb \
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 In this example, there is already a GraphDB docker container running, hence we can connect the docker containers. Therefore, the `OUTPUT_ENDPOINT` url contains the hostname "graphdb", as inserted by the `--link` option. If the endpoint is running at a different location, you can specify the full URL of that location, an omit the `--link` option.

 #### CSV folder example
 **on linux/macOS**
 ```
docker run --rm \
    -e DB_JDBC="jdbc:relique:csv:/data?fileExtension=.csv" \
    -e DB_USER=user \
    -e DB_PASS=pass \
    -e DB_DRIVER=org.relique.jdbc.csv.CsvDriver \
    -e SLEEPTIME=60 \
    -e OUTPUT_ENDPOINT="http://graphdb:7200/repositories/sage" \
    -v $(pwd)/dataFolder:/data \
    --link graphdb:graphdb \
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 **on Windows**
 ```
docker run --rm \
    -e DB_JDBC="jdbc:relique:csv:/data?fileExtension=.csv" \
    -e DB_USER=user \
    -e DB_PASS=pass \
    -e DB_DRIVER=org.relique.jdbc.csv.CsvDriver \
    -e SLEEPTIME=60 \
    -e OUTPUT_ENDPOINT="http://graphdb:7200/repositories/sage" \
    -v %cd%/dataFolder:/data \
    --link graphdb:graphdb \
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

#### H2 file database example

Please see the command line instruction below and replace `database_file_name` with the filename of your database (without the extension). Furthermore, copy the file database into the sub-folder `./db`. As an alternative, edit the line `-v $(pwd)/db:/db \` into `-v /folder/db/path:/db \` where "/folder/db/path" is the location of the H2 file database.

The ontology and output files will be stored in the current folder.

```
touch $(pwd)/output.ttl
touch $(pwd)/ontology.owl

docker run --rm \
    -e DB_JDBC="jdbc:h2:file:/db/database_file_name" \
    -e DB_USER=sa \
    -e DB_PASS=sa \
    -e DB_DRIVER=org.h2.Driver \
    -v $(pwd)/output.ttl:/output.ttl \
    -v $(pwd)/ontology.owl:/ontology.owl \
    -v $(pwd)/db:/db \
    registry.gitlab.com/um-cds/fair/tools/triplifier:master
```

#### SQLite file database example

For SQLite, please change the line `-v $(pwd)/db.sqlite:/my.db \` where `$(pwd)/db.sqlite` represents the local file database which is being used for analysis.

```
touch $(pwd)/output.ttl
touch $(pwd)/ontology.owl

docker run -it --rm \
    -e DB_JDBC="jdbc:sqlite:/my.db" \
    -e DB_DRIVER=org.sqlite.JDBC \
    -v $(pwd)/output.ttl:/output.ttl \
    -v $(pwd)/ontology.owl:/ontology.owl \
    -v $(pwd)/db.sqlite:/my.db \
    registry.gitlab.com/um-cds/fair/tools/triplifier:sqlite
```
 
 ## Annotations using the result
 An example of annotations (and insertions) can be found in the following repository:
 * [https://gitlab.com/UM-CDS/fair/data/maastro-rectum](https://gitlab.com/UM-CDS/fair/data/maastro-rectum)