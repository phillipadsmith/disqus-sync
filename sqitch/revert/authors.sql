-- Revert authors

BEGIN;

DROP TABLE disqus.authors;

COMMIT;
