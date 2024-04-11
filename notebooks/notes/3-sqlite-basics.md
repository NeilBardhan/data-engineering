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

We can add as many books into the `book` table as long as we have a corresponding author in the `author` table.

```SQL
INSERT INTO book (title, author_id) VALUES ('The Good Earth', 1);
INSERT INTO book (title, author_id) VALUES ('Adventures of Huckleberry Finn', 2);
INSERT INTO book (title, author_id) VALUES ('Life on the Mississippi', 2);
INSERT INTO book (title, author_id) VALUES ('The Hunt for Red October', 3);
```

## `SELECT` Statements

We can select data from our tables using the `SELECT` command.

```sql
SELECT * FROM author;
```

`SELECT *`  will return all columns from the `author` table. Since there is no `WHERE` clause, all rows will be returned as well.

### `WHERE` Clause

We can **filter** our `SELECT` statements using the `WHERE` clause, wherein we specify conditions that must be met by the rows being returned.

```sql
SELECT first_name, last_name FROM author WHERE author_id = 1;
```

The above statement will return the first and last names of the author whose `author_id` is `1`. Since `author_id` is the primary key, only one row will be returned.

If we wanted to view the titles of all books alongside the author names, we would first **join** the tables on the `author_id` before `SELECT`ing from the resulting table.

```sql
SELECT
a.first_name, a.last_name, b.title AS book_title
FROM author a JOIN book b
ON b.author_id = a.author_id
ORDER BY a.last_name asc;
```

We can have complex conditions in a `WHERE` clause. If we want to see the titles of all books written by `Mark Twain`, we can run the following SQL query.

```sql
SELECT b.title
FROM author a JOIN book b
ON b.author_id = a.author_id
WHERE a.first_name = 'Mark' AND a.last_name = 'Twain';
```

## Wrapping Up
To leave the `sqlite` command line session: `Ctrl + D`