# Data Engineering

**Quote:** "*Data engineers are the designers, builders and managers of the information or "big data" infrastructure. They develop the architecture that helps analyze and process data in the way the organization needs it. And they make sure those systems are performing smoothly*.

In computing, **Extract, Transform and Load** (ETL) refers to a process in database usage and especially in data warehousing that: Extracts data from homogeneous or heterogeneous data sources. Transforms the data for storing it in proper format or structure for querying and analysis purpose.

Computer programming languages for **defining data structures**:

- **Data Manipulation Language** (DML) is used to retrieve, store, modify, delete, insert and update data in database. Examples: `SELECT`, `UPDATE`, `INSERT` statements.
- **Data Definition Language** (DDL) is used to create and modify the structure of database objects in database. Examples: `CREATE`, `ALTER`, `DROP` statements.
- **Data Control Language** (DCL) is used to create roles, permissions, and referential integrity as well it is used to control access to database by securing it. Examples: `GRANT`, `REVOKE` statements.
- **Transactional Control Language** (TCL) is used to manage different transactions occurring within a database. Examples: `COMMIT`, `ROLLBACK` statements.

Sample methods used to ensure representativeness:

- Simple Random Sampling
- Stratified Sampling
- Cluster Sampling
- Quantitative Sampling
- Systematic Sampling

## `scp`

`scp` allows files to be copied to, from, or between different hosts. It uses ssh for data transfer and provides the same authentication and same level of security as `ssh`.

    scp <file> <env>:~/<directory>/     # Secure copy of the local to remote host  
    scp serde.sh PROD01:~/samovich/     # Example

    scp scp <env>:~/<directory>/<file>      # Secure copy from remote to local host
    scp scp PROD01:~/files/serde.ddl.sql .  # Example

## `gzip`

`gzip` is a file format and a software application used for file compression and decompression. 
    
Using gunzip command to **`unzip`** file:

    $ gunzip file.gz
    $ ls [file]

Using **`gzip -d`** command:
    
    $ gzip -d file.gz
    $ ls [file]

If file extension is **`.tar.gz`**, type the command:

    # to unzip file(s) or directorie(s)
    $ tar -zxvf [file].tar.gz
    
    # to zip file(s) or directorie(s) with .tar.gz
    tar -zcvf [file].tar.gz [fileOrDirectory1] [fileOrDirectly2] [fileOrDirectoryN]
## Hadoop

    # Copy the files
    hadoop distcp /[path]/* /[path]

## Hive

The Apache **Hive** ™ data warehouse software facilitates querying and managing large datasets residing in distributed storage. Use the -f flag to specify a file that contains a hive script.
    
    # Enable header
    set hive.cli.print.header=true;
    
    # Set number of reducers
    set  mapred.reduce.tasks=32
    
    # Execute the hive script from file
    $ hive -f query.sql
    
    # Use database
    use [database-name];
    
    # show table ddl statement
    show create table [table-name];
    
Hive organizes tables into **partitions**. It is a way of dividing a table into related parts based on the values of partitioned columns such as date, city, and department. Using partition, it is easy to query a portion of the data.

    # Show talbe partitions
    show partitions [table-name];
    
    # Select a partition
    SELECT [column-1], [colum-2], [column-n] FROM [table-name] WHERE ([patition-name]="[fragmnet]");
    
    # Adding a Partition
    ALTER TABLE [table-name] ADD [IF NOT EXISTS] PARTITION([patition-name]="[fragmnet]");
    
    # Dropping a Partition
    ALTER TABLE [table-name] DROP [IF EXISTS] PARTITION([patition-name]="[fragmnet]");

    # hadoop distcp /data/hive/warehouse/thome127.db/bp_wdw_tmp /data/hive/warehouse/samov004.db/bp_wdw_tmp
Code formatting for SQL queries (tabbing and alignment has no standard, commas are usually leading).

    SELECT [clause] 
         , [clause-1]
         , [clause-2]
         , [clause-n]
    FROM   [clause] 
    WHERE  [clause] 
      AND  [clause]
    ORDER  BY [clause]
            , [clause-1];
 
## Java

Run `.jar` via command line(**FQCN** stands for Fully-Qualified Class Name):

    java [first-argument] [second-argument] -classpath [jar-location] [FQCN]
    java -Dinput=/Users/samov004/Downloads/test.xls -Doutput=/Users/samov004/Downloads/result.csv -classpath cima-data-utils-1.0-SNAPSHOT.jar com.disney.cima.converters.ConvertXLStoCSV

## Bash
    
    # Save -n lines to file first(.txt, .csv)
    head -100 file > file.txt
    
    # Execute script 30 times from 22 to 52, by passing different value
    for I in {[number-from]..[number-to]}; do bash [script-name].sh $I; done
    for I in {22..52}; do bash simba.main.sh $I; done
    
    # Other types of loops
    for I in {1..10}; do echo $I; done 
    for I in 1 2 3 4 5 6 7 8 9 10; do echo $I; done
    for I in $(seq 1 10); do echo $I; done
    for ((I=1; I <= 10 ; I++)); do echo $I; done

    # Strip first line in file(.txt, .csv)
    tail -n+2 /path/to/file > /path/to/output
    
    # Save a line to a file
    grep [options] [input-file] >> [new-file]
    grep '[[:space:]]47[[:space:]]' 2015_26-53.txt >> 47.txt    # example
    
    # Merge multiply files into one(.csv, .txt):
    cat *.txt > merged.txt
    
    # Regex vs. String
    REGEX='<a href="(getfile.php\?c=.+)">'
    FILE='[&nbsp;<a href="...">download</a>&nbsp;]</span><br />'
    
    if [[ ${FILE} =~ ${REGEX} ]]; then
        echo The regex matches!
        echo $BASH_REMATCH
        echo ${BASH_REMATCH[1]}
    fi
    
    # Remove empty line
    grep -v '^$' [file.txt] > [new-file.txt]
    
    # regex with string
    REGEX="^[[:upper:]]{2}[[:lower:]]*$"
    STRING="HEllo"
    if [[ $STRING =~ $REGEX ]]; then
      echo "Match."
    else
      echo "No match."
    fi
    
    # recursive statistics on file types in directory
    find . -type f | sed 's/.*\.//' | sort | uniq -c
    
- [Bash manual](http://www.gnu.org/software/bash/manual/bashref.html#index-_005b_005b)
- [Posix document](http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html)

## Python

Reading specific columns from a text file
    
    # Open text file
    file = open(inputFile, "r")
    # Global variables
    lines=file.readlines()
    result=[]
    # Loop over lines and add values to list
    for x in lines:
        result.append(x.split('\t')[12])
    # Print the list
    print result
    # CLose text file
    file.close()
    
    # List of strings. List comprehension is a syntactic construct available
    listOfValues = ['1', '2', '3']
    # Convert string values to number
    listOfValues = [int(i) for i in listOfValues]
    
    # Run MapReduce locally
    cat sample.txt | ./mapper.py | ./reducer.py

## MySQL

Connecting to the **MySQL** Server

    mysql -u [username] -p[password] -h [hostname] [database] 

    -u: username
    -p: password (**no space after**)
    -h: host
    last one is name of the database that you wanted to connect.

Using MySQL client (e.g CLI, Query Browser) to check MySQL version:
    
    SELECT version();
    SELECT @@version;
