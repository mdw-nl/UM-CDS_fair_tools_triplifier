# Repository moved
**This repository has been moved to [https://github.com/MaastrichtU-CDS/triplifier](https://github.com/MaastrichtU-CDS/triplifier)**

You can update your origin using the following command (if you previously cloned the repository): `git remote set-url origin git@github.com:MaastrichtU-CDS/triplifier.git`.

# Triplifier

This repository creates the tooling project for the Triplifier.

## References
* Soest J van, Choudhury A, Gaikwad N, Sloep M, Dumontier M, Dekker A (2019) [Annotation of Existing Databases using Semantic Web Technologies: Making Data more FAIR.](http://ceur-ws.org/Vol-2849/#paper-11) CEUR-WS, Edinburgh, pp 94–101


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

**H2 database file**
```
jdbc.url = jdbc:h2:file:/db/database_file_name
jdbc.user = sa
jdbc.password = sa
jdbc.driver = org.h2.Driver
```

**SQLite database file**
```
jdbc.url = jdbc:sqlite:/my.db
jdbc.user = user
jdbc.password = pass
jdbc.driver = org.sqlite.JDBC
```

**Folder with CSV files**
```
jdbc.url = jdbc:relique:csv:C:\\Users\\johan\\test?fileExtension=.csv
jdbc.user = user
jdbc.password = pass
jdbc.driver = org.relique.jdbc.csv.CsvDriver
```

### Upload triples to RDF endpoint

To upload data directly into an RDF endpoint (and hence save the memory footprint), please add the following variables in the properties file (default: triplifier.properties):

* *repo.type*: Indicating the type of RDF endpoint. The following values are allowed for this variable:
    * "memory": this is the default, in-memory (and file-based) RDF/OWL output
    * "sparql": upload the triples directly in a SPARQL endpoint using the SPARQL protocol
    * "rdf4j": upload the triples directly in an RDF4j repository (e.g. a RDF4j or GraphDB database)
* *repo.url*: the URL of the RDF endpoint (not applicable or needed for `repo.type = memory`). In case of a SPARQL endpoint, include the URL of the actual SPARQL endpoint. In case of RDF4j, indicate the URL of the repository server
* *repo.id*: for `repo.type = rdf4j` indicate the repository ID
* *repo.user*: optional, specify the username for password-protected rdf4j repositories
* *repo.pass*: optional, specify the password for password-protected rdf4j repositories

An example of the full specification is given below:

```
repo.type = rdf4j
repo.url = http://localhost:7200
repo.id = data
repo.user = userNameTest
repo.pass = test
```

### Optional arguments

By default, the tool will generate an ontology file (ontology.owl) and a turtle file containing the materialized triples (output.ttl) relative to the execution folder. To change this, the following additional arguments can be used:

* -o <output_path_for_materialized_triples_file>
* -t <output_path_for_ontology_file>
* -c
* -b
* --ontologyAndOrData [ontology|data]

## Run as Docker container

To run the triplifier as Docker container, you can run the following command:

**On Linux/Unix/macOS systems:**
 ```
docker run --rm \
    -v $(pwd)/output.ttl:/output.ttl \
    -v $(pwd)/ontology.owl:/ontology.owl \
    -v $(pwd)/triplifier.properties:/triplifier.properties \
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 **On windows systems:**
 ```
docker run --rm ^
    -v %cd%/output.ttl:/output.ttl ^
    -v %cd%/ontology.owl:/ontology.owl ^
    -v %cd%/triplifier.properties:/triplifier.properties ^
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 ### Run as a service

 The example below shows how to run the container as a service, where the materialization process is called every interval time (defined by `SLEEPTIME` in seconds).

 ```
docker run --rm \
    -e SLEEPTIME=10 \
    --link graphdb:graphdb \
    -v $(pwd)/triplifier.properties:/triplifier.properties \
    registry.gitlab.com/um-cds/fair/tools/triplifier:latest
 ```

 In this example, there is already a GraphDB docker container running, hence we can connect the docker containers. Therefore, the `repo.url` in the properties file should containthe hostname "graphdb", as inserted by the `--link` option. If the endpoint is running at a different location, you can specify the full URL of that location in the properties file, an omit the `--link` option.
 
 ## Annotations using the result
 An example of annotations (and insertions) can be found in the following repository:
 * [https://gitlab.com/UM-CDS/fair/data/maastro-rectum](https://gitlab.com/UM-CDS/fair/data/maastro-rectum)
