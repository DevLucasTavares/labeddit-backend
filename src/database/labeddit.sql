-- Active: 1695064665764@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    nickname TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);
DROP TABLE users;

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    upvotes INTEGER DEFAULT(0) NOT NULL,
    downvotes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);
DROP TABLE posts;

CREATE TABLE upvote_downvote_post (
  user_id TEXT NOT NULL,
  post_id TEXT NOT NULL,
  vote INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
DROP TABLE upvote_downvote_post;

CREATE TABLE comments (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    post_id TEXT NOT NULL,
    content TEXT NOT NULL,
    upvotes INTEGER DEFAULT(0) NOT NULL,
    downvotes INTEGER DEFAULT(0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);
DROP TABLE comments;

CREATE TABLE upvote_downvote_comment (
  user_id TEXT NOT NULL,
  comment_id TEXT NOT NULL,
  vote INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (comment_id) REFERENCES comments(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
DROP TABLE upvote_downvote_comment;

CREATE TABLE followers (
  user_id TEXT NOT NULL,
  user_followed_id TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (user_followed_id) REFERENCES users(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


-- INSERTS
INSERT INTO users (id, email, password, nickname, role)
VALUES
  -- tipo NORMAL e senha = TheresAPasswordHere
  ('u001','justjohndoe@email.com','$2a$12$2EeBCPjYDDhFo7BC9xn5m.hjdntB8ZtYgpz43x2zT4Sv0kDMtkdMi
','JohnDoe','NORMAL'),
  -- tipo NORMAL e senha = TheresAnotherPasswordHere
  ('u002','justjanedoe@email.com','$2a$12$7/1T9Dgf/ipvqKY1rvQs6uaZrY8wwW6/0wt5tXEp2caANnlUM/YbW
','JaneDoe','NORMAL'),
  -- tipo PREMIUM e senha = TheresAStyledPasswordHere
  ('u003','thelilgideon@email.com','$2a$12$xSQCNbbxNtMpP5WyYiISwO82ePVghCscXZ6L/aMuUQSeryr321Z.u
','LilGideon','PREMIUM'),
  -- tipo ADMIN e senha = TheresASuperSafePasswordHere
  ('u004','starboy@email.com','$2a$12$yNotJhAzBwOpbCmOdXG11eyZLcMlqXTxsh6LCjhnlAwGIsi0NxBMq
','Starboy','ADMIN');
  
  INSERT INTO posts(id, creator_id, title, content)
  VALUES
  ('p001', 'u001', 'GOTY 2023', 'Tears of The Kingdom will win for sure'),
  ('p002', 'u001', '2nd place?', 'Starfield or Baldurs Gate?');

INSERT INTO upvote_downvote_post(user_id, post_id, vote)
VALUES
('u002', 'p001', 1),
('u002', 'p002', 0);

INSERT INTO comments(id, user_id, post_id, content)
VALUES
('c001', 'u002', 'p002', 'Baldurs hell yeah');

INSERT INTO upvote_downvote_comment(user_id, comment_id, vote)
VALUES
('u001', 'c001', 1);

INSERT INTO followers(user_id, user_followed_id)
VALUES
('u001', 'u002'),
('u002', 'u001');

-- TESTES
SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM upvote_downvote_post;
SELECT * FROM comments;
SELECT* FROM upvote_downvote_comment;
SELECT * FROM followers;