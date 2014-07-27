-- Verify posts

BEGIN;

SELECT id, author_id -- Could do more, but this is fine
  FROM disqus.posts
 WHERE FALSE;

ROLLBACK;
