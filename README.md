Custom ELT Project



This repository contains a custom Extract, Load, Transform (ELT) project that utilizes Docker and PostgreSQL to demonstrate a simple ELT process.

Repository Structure



&nbsp;   docker-compose.yaml: This file contains the configuration for Docker Compose, which is used to orchestrate multiple Docker containers. It defines three services:

&nbsp;       source\_postgres: The source PostgreSQL database.

&nbsp;       destination\_postgres: The destination PostgreSQL database.

&nbsp;       elt\_script: The service that runs the ELT script.



&nbsp;   elt\_script/Dockerfile: This Dockerfile sets up a Python environment and installs the PostgreSQL client. It also copies the ELT script into the container and sets it as the default command.



&nbsp;   elt\_script/elt\_script.py: This Python script performs the ELT process. It waits for the source PostgreSQL database to become available, then dumps its data to a SQL file and loads this data into the destination PostgreSQL database.



&nbsp;   source\_db\_init/init.sql: This SQL script initializes the source database with sample data. It creates tables for users, films, film categories, actors, and film actors, and inserts sample data into these tables.



How It Works



&nbsp;   Docker Compose: Using the docker-compose.yaml file, three Docker containers are spun up:

&nbsp;       A source PostgreSQL database with sample data.

&nbsp;       A destination PostgreSQL database.

&nbsp;       A Python environment that runs the ELT script.



&nbsp;   ELT Process: The elt\_script.py waits for the source PostgreSQL database to become available. Once it's available, the script uses pg\_dump to dump the source database to a SQL file. Then, it uses psql to load this SQL file into the destination PostgreSQL database.



&nbsp;   Database Initialization: The init.sql script initializes the source database with sample data. It creates several tables and populates them with sample data.



CRON Job Implementation



In this branch, a CRON job has been implemented to automate the ELT process. The CRON job is scheduled to run the ELT script at specified intervals, ensuring that the data in the destination PostgreSQL database is regularly updated with the latest data from the source database.



To configure the CRON job:



&nbsp;   Currently, the CRON job is setup to run every day at 3am.

&nbsp;   You can adjust the time as needed within the Dockerfile found in the elt\_script folder.



