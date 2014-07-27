-- Deploy authors
-- requires: schema

BEGIN;
 
    SET client_min_messages = 'warning';
     
    CREATE TABLE disqus.authors (
        id                  INT         PRIMARY KEY,
        username            TEXT        NOT NULL,
        name                TEXT        NOT NULL,
        email               TEXT        NOT NULL,
        emailHash           TEXT        NOT NULL,
        url                 TEXT        NOT NULL,
        joinedAt            timestamp   NOT NULL,
        reputation          float8      NOT NULL,
        about               TEXT        NULL,
        avatar_permalink    TEXT        NOT NULL,
        -- The two JSON types require a newer version of PostgreSQL
        -- avatar              JSON        NULL, -- This is an object
        -- connections         JSON        NULL, -- This is also an object
        -- numPosts            INT         NOT NULL, Should be there, but isn't
        location            TEXT        NULL,
        profileUrl          TEXT        NOT NULL,
        -- numLikesReceived    INT         NOT NULL, Should be there, but isn't
        isVerified          boolean     NOT NULL
        -- numFollowing        INT     NOT NULL Should be there, but isn't
    );

COMMIT;
