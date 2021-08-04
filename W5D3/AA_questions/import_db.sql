-- Add a users table.
    -- Should track fname and lname attributes.
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lame TEXT
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
    SELECT *
    FROM users
    JOIN questions
        ON users.id = questions.id
);

-- Add a replies table.
    -- Each reply should contain a reference to the subject question.
    -- Each reply should have a reference to its parent reply.
    -- Each reply should have a reference to the user who wrote it.
    -- Don't forget to keep track of the body of a reply.
    -- "Top level" replies don't have any parent, but all replies have a subject question.
    -- It's okay for a column to be self referential; a foreign key can point to a primary key in the same table.
CREATE TABLE replies (
    reply_id INTEGER PRIMARY KEY,
    order INTEGER,
    subjects TEXT,
    reply TEXT,
    questioner_id INTEGER,
    body TEXT,

    FOREIGN KEY (subjects) REFERENCES questions(title)
    FOREIGN KEY (reply) REFERENCES replies(reply_id)
    FOREIGN KEY (questioner_id) REFERENCES questions(author_id)
);

INSERT INTO
replies (subjects, child_reply)
VALUES
(SQL, answer)

-- Add a question_likes table.
    -- Users can like a question.
    -- Have references to the user and the question in this table
