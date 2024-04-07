# Working with `sqlite` and `sqlalchemy` in Python

SQL is the language used to interact with relational databases. Using `sqlite` and `sqlalchemy` we can leverage SQL within Python to work with databases.

## Data

Software is all about manipulating data. Data needs to persist between programs.

The simplest way to do that would be to use flat files like `.csv` files. However, these files are very simplistic and have no way to express the relationships between elements of the data. This is where relational databases come in. They give us more power to express items and their relationships.

Most relational databases support SQL.

## `sqlite`

`sqlite` is a **lightweight, single file database engine** that comes with a command line control program.

## `sqlalchemy`

`sqlalchemy` is a third party python library that abstracts SQL through raw methods, statements and an **object relational mapping (ORM)**. We can use it as a core SQL wrapper or use it an ORM that lets us treat rows in a database as python objects for more powerful manipulation.