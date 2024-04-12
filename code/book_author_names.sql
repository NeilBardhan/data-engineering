
SELECT
a.first_name, a.last_name, b.title AS book_title
FROM author a JOIN book b
ON b.author_id = a.author_id
ORDER BY a.last_name asc;
