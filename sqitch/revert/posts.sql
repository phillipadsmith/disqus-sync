-- Revert posts

BEGIN;

    DROP TABLE disqus.posts;

COMMIT;
