CREATE DATABASE catalog_database;

-- Create Label table
CREATE TABLE Label(
 id INTEGER GENERATED ALWAYS AS IDENTITY,
 title VARCHAR(30),
 color VARCHAR(10),
 PRIMARY KEY(id)
);

-- Create Book table  
CREATE TABLE Book(
  id INT GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(50),
  cover_state VARCHAR(5),
  publish_date DATE,
  archived BOOLEAN,
  label_id  INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_bk FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE CASCADE  
);
