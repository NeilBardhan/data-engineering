SELECT b.title
FROM author a JOIN book b
ON b.author_id = a.author_id
WHERE a.first_name = 'Mark' AND a.last_name = 'Twain';