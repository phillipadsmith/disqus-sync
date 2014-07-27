-- Deploy posts
-- requires: authors
-- requires: schema

BEGIN;

    SET client_min_messages = 'warning';

    CREATE TABLE disqus.posts (
        id	        int        PRIMARY KEY, 
        createdAt	timestamp   not null,
        parent	        int         null,
        thread	        text        not null,
        author_id	int         REFERENCES disqus.authors (id),
        isFlagged       boolean     not null,
        isDeleted	boolean     not null,
        isApproved	boolean     not null,	
        likes	        int         not null,
        dislikes	int         not null,
        points	        int         not null,
        numReports	int         not null,
        isEdited	boolean     not null,
        isSpam	        boolean     not null,
        isHighlighted	boolean     not null,
        raw_message	text        not null,
        message	        text        not null 
    );

COMMIT;
