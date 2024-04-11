# SQLite basics

SQLite is a small, self-contained SQL database engine. It is a command line tool that comes pre-loaded in almost all UNIX distributions, especially **Ubuntu** and **MacOS**. 

The command-line tool for SQLite is called `sqlite3`. When we run it, we give it the name of the file that it will be using as its storage mechanism.

So, simply running `sqlite3 data/db/books.db` will create a database file called `books.db` in `data/db/`.

In SQLite we can interact with the database engine in 2 ways: 
  
  1. **Dot** commands: The dot commands are built-in utilities provided by SQLite. 
  2. We can enter SQL directly, which is the language we use to do things in the database.

## Creating our first tables

Running `sqlite3 data/db/books.db` starts a `sqlite` session. When we start a session for the first time with a new `.db` file, we need to create a table to persist the `.db` file on the disk.

To create a table we run the following lines in `sqlite` 

```sql
CREATE TABLE author (
    author_id INTEGER NOT NULL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR
);
```

Once this `author` table has been created, we will see `books.db` as a file in our file explorer. 

We can list all tables in `books.db` using the `.tables` command.

We can insert data into our table using the `INSERT` command.

```sql
INSERT INTO author (first_name, last_name) VALUES ('Pearl', 'Buck');
INSERT INTO author (first_name, last_name) VALUES ('Mark', 'Twain');
INSERT INTO author (first_name, last_name) VALUES ('Tom', 'Clancy');
INSERT INTO author (first_name, last_name) VALUES ('Isaac', 'Asimov');
```

We can select data from our table using the `SELECT` command.

```sql
SELECT * FROM author;
```

`SELECT *`  will return all columns from the `author` table. Since there is no `WHERE` clause, all rows will be returned as well.

```
SELECT first_name, last_name FROM author WHERE author_id = 1;
```

The above statement will return the first and last names of the author whose `author_id` is `1`. Since `author_id` is the primary key, only one row will be returned.

We can create a `book` table as follows - 

```sql
CREATE TABLE book (
    book_id INTEGER NOT NULL PRIMARY KEY,
    title VARCHAR,
    author_id INTEGER REFERENCES author
);
```

The `author_id` column acts as a foreign key that references the primary key of the `author` table. This helps create an **entity relationship** between the `author` and `book` tables.

Running `.tables` now will return 2 tables: `author` and `book`.

We can insert values into `book`. 

```SQL
INSERT INTO book (title, author_id) VALUES ('Foundation', 4);
```

The above statement inserts `Foundation` and ties it to `Isaac Asimov`, the author whose `author_id` is `4`.


To leave the `sqlite` command line session: `Ctrl + D`