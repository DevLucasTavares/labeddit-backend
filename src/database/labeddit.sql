-- Active: 1695064665764@@127.0.0.1@3306
CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
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

CREATE TABLE upvote_downvote (
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
DROP TABLE upvote_downvote;

INSERT INTO users (id, name, email, password, role)
VALUES
  -- tipo NORMAL e senha = fulano123
	('u001', 'Fulano', 'fulano@email.com', '$2a$12$qPQj5Lm1dQK2auALLTC0dOWedtr/Th.aSFf3.pdK5jCmYelFrYadC', 'NORMAL'),
  -- tipo NORMAL e senha = beltrana00
	('u002', 'Beltrana', 'beltrana@email.com', '$2a$12$403HVkfVSUbDioyciv9IC.oBlgMqudbnQL8ubebJIXScNs8E3jYe2', 'NORMAL'),
  -- tipo ADMIN e senha = astrodev99
	('u003', 'Astrodev', 'astrodev@email.com', '$2a$12$lHyD.hKs3JDGu2nIbBrxYujrnfIX5RW5oq/B41HCKf7TSaq9RgqJ.', 'ADMIN');
  
  INSERT INTO posts(id, creator_id, title, content)
  VALUES
  ('p001', 'u001', 'GOTY 2023', 'Tears of The Kingdom will win for sure'),
  ('p002', 'u001', '2nd place?', 'Starfield or Baldurs Gate?');

INSERT INTO upvote_downvote(user_id, post_id, vote)
VALUES
('u002', 'p001', 1),
('u002', 'p002', 0);

SELECT * FROM users;
SELECT * FROM posts;
SELECT * FROM upvote_downvote;