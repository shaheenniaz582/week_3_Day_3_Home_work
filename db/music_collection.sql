DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(

  id SERIAL PRIMARY KEY,
  name VARCHAR(255)

);

CREATE TABLE albums(
  
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genere VARCHAR(12),
  artist_id INT REFERENCES artists(id)

);
