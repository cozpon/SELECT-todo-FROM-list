--1. Write a query to drop a database named `todo_app` if it exists

DROP DATABASE IF EXISTS todo_app;

--1. Write a query to delete a user named `michael` if it exists

DROP USER IF EXISTS michael;

--1. Write a query to create a user named `michael` with an encrypted password `stonebreaker`

CREATE USER michael
WITH ENCRYPTED PASSWORD 'sqlsucks';

--1. Write a query to create a database named `todo_app`

CREATE DATABASE todo_app;

-- 1. Connect to the newly created database

\c todo_app;

-- 1. Write a query to create a table named `tasks` using the
-- **Initial columns** detailed below

CREATE TABLE tasks(
    id          SERIAL         NOT NULL PRIMARY KEY,
    title       VARCHAR(255)   NOT NULL,
    description TEXT           NULL,
    created_at  TIMESTAMP      NOT NULL DEFAULT now(),
    updated_at  TIMESTAMP      NULL,
    completed   BOOLEAN        NOT NULL DEFAULT false

);


--1. Write queries to accomplish the following
--  1. remove the column named `completed`
--  1. add a column to `tasks` named `completed_at`:timestamp,
--  that may be NULL, and has a default value of `NULL`.
--  1. change the `updated_at` column to not allow NULL values,
--  and have a default value of `now()`

ALTER TABLE tasks
  DROP COLUMN completed,
  ADD COLUMN completed_at TIMESTAMP NULL DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

-- create a new task, by only setting values (not defining which columns)
--   `id = default value`
--   `title = 'Study SQL'`
--   `description = 'Complete this exercise'`
--   `created_at = now()`
--   `updated_at = now()`
--   `completed_at = NULL`

INSERT INTO tasks VALUES (DEFAULT, 'Study SQL', 'Complete this exercise', now(), now(), NULL);

-- create a new task
-- title = 'Study PostgreSQL'
-- description = 'Read all the documentation'

INSERT INTO tasks (title, description)
  VALUES ('Study PostgreSQL', 'Read all the documentation');

-- select all the titles of tasks that are not yet completed

SELECT title
FROM tasks
WHERE completed_at IS NULL;

-- update the task with a title of 'Study SQL' to be completed as of now



-- select all titles and descriptions of tasks that are not yet completed

-- select all fields of every task sorted by creation date in descending order
-- create a new task
-- title = 'mistake 1'
-- description = 'a test entry'