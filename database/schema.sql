CREATE TABLE labels(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  title TEXT,
  color TEXT,
);

CREATE TABLE sources(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE genres(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE authors(
  id GENERATED ALWAYS AS IDENTITY,
  first_name TEXT,
  last_name TEXT,
  PRIMARY KEY(id)
);

CREATE TABLE books(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  genre INTEGER REFERENCES genres(id),
  author INTEGER REFERENCES authors(id),
  label INTEGER REFERENCES labels(id),
  source INTEGER REFERENCES sources(id),
  publish_date DATE,
  archived BOOLEAN,
  publisher TEXT,
  cover_state TEXT,
);

CREATE TABLE movies(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  genre INTEGER REFERENCES genres(id),
  author INTEGER REFERENCES authors(id),
  label INTEGER REFERENCES labels(id),
  source INTEGER REFERENCES sources(id),
  publish_date DATE,
  archived BOOLEAN,
  silet BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE musicAlbum(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  genre INTEGER REFERENCES genres(id),
  author INTEGER REFERENCES authors(id),
  label INTEGER REFERENCES labels(id),
  source INTEGER REFERENCES sources(id),
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY(id)
);

CREATE TABLE games(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  genre INTEGER REFERENCES genres(id),
  author INTEGER REFERENCES authors(id),
  label INTEGER REFERENCES labels(id),
  source INTEGER REFERENCES sources(id),
  publish_date DATE,
  multiplayer BOOLEAN,
  las_time_played_at DATE,
  PRIMARY KEY(id)
);