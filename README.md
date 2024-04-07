# Automated Data Pipelines with `sqlite`, `sqlalchemy` and `airflow`

<hr>

## Overview
This repo contains code for automating data pipelines and data engineering tasks. The purpose of this repo is to build automated data pipelines that -
  
- Query data from REST APIs using `requests`.
- Using `json` and `pandas` tp clean and transform the raw data.
- Storing data into relational databases using `sqlite` and `sqlalchemy`.
- Update databases on a schedule using `cron` and `airflow`.

This repo also contains notes and code from the [Real Python SQLite and SQLAlchemy](https://realpython.com/courses/sqlite-sqlalchemy-python-beyond-flat-files/) course.

<hr>

## Data Sources

- [Iowa Environmental Mesonet](https://mesonet.agron.iastate.edu/request/daily.phtml)
- [NASDAQ100](https://fred.stlouisfed.org/series/NASDAQ100) from the St. Louis Federal Reserve ([FRED](https://fredhelp.stlouisfed.org/fred/about/about-fred/what-is-fred/))