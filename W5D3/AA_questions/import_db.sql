PRAGMA foreign_keys = ON;
-- DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;
-- users,questions,question_follows,replies

-- Add a users table.
    -- Should track fname and lname attributes.
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT
);

-- Add a questions table.
    -- Track the title, the body, and the associated author (a foreign key).
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,     -- allowed?
    title TEXT,
    body TEXT,
    author_id INTEGER,

    FOREIGN KEY(author_id) REFERENCES users(id)
    -- FOREIGN KEY(title) REFERENCES replies(subjects)
);

-- Add a question_follows table.
    -- This should support the many-to-many relationship between questions and users 
        -- (a user can have many questions she is following, and a question can have many followers).
    -- This is an example of a join table; the rows in question_follows are used to join users to questions and vice versa.
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

-- Add a replies table.
    -- Each reply should contain a reference to the subject question.
    -- Each reply should have a reference to its parent reply.
    -- Each reply should have a reference to the user who wrote it.
    -- Don't forget to keep track of the body of a reply.
    -- "Top level" replies don't have any parent, but all replies have a subject question.
    -- It's okay for a column to be self referential; a foreign key can point to 
        -- a primary key in the same table.
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    -- order INTEGER,
    body TEXT,
    question_id INTEGER,
    user_id INTEGER,
    parent_reply_id INTEGER,

    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)

);

-- Add a question_likes table.
    -- Users can like a question.
    -- Have references to the user and the question in this table
CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (question_id) REFERENCES questions (id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Danny', 'Park' ),
    ('Vern', 'Chao' ),
    ('Spencer', 'Lascone' ),
    ('Zack', 'Barbieri' );    

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('SQL', 'what is sql?' , 3),
    ('SQL', 'how do u join?',  3),
    ('Ruby', 'how do u iterate', 4 ),
    ('Python', 'how do u forloop', 2),   
    ('C++', 'what is this', 1 ),  
    ('Java', 'is it hard?' , 4);    

INSERT INTO
    replies (body, question_id, user_id, parent_reply_id)
VALUES
    ('It is structured query language', 1, 2 ,NULL ),
    ('It is structured query language', 1,  3, NULL),
    ('SELECT -> FROM -> JOIN', 2,  1, NULL),
    ('but how do u spell structured?', 1,  4, 1),
    ('but how do u spell databases?', 1,  3, 2); 

INSERT INTO
    question_likes (user_id, question_id)
Values
    (1, 4),
    (2, 3),
    (3, 2),
    (4, 1),
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4);





-- SELECT * FROM users;
-- SELECT * FROM questions;
-- SELECT * FROM question_follows;
-- SELECT * FROM replies;
-- SELECT * FROM question_likes;