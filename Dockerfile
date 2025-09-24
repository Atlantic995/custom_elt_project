FROM apache/airflow:2.7.2

USER airflow

RUN pip install "apache-airflow-providers-docker"

USER root