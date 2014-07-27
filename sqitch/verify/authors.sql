-- Verify authors

BEGIN;

SELECT id, username, email -- Could do more, but this is fine
  FROM disqus.authors
 WHERE FALSE;

ROLLBACK;
