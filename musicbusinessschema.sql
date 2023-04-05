DROP DATABASE IF EXISTS musicbusiness;
CREATE DATABASE musicbusiness;
USE musicbusiness;

CREATE TABLE IF NOT EXISTS artist (

  artist_id INT PRIMARY KEY,
  fname VARCHAR(20),
  lname VARCHAR(20),
  birthdate VARCHAR(12)
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS genre (

  gname VARCHAR(20) PRIMARY KEY
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS song (

  song_id INT PRIMARY KEY,
  title VARCHAR(50),
  artist_id INT,
  duration VARCHAR (10),
  genre VARCHAR(20),
  explicit BOOLEAN,
  link VARCHAR(80),
  
  CONSTRAINT fk_song_artist
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id),
  
  CONSTRAINT fk_song_genre
  FOREIGN KEY (genre) REFERENCES genre (gname)
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS users (

  user_id INT PRIMARY KEY,
  fname VARCHAR(20),
  lname VARCHAR(20),
  upassword VARCHAR(50),
  email VARCHAR(50)
  
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS playlist (

  playlist_id INT PRIMARY KEY,
  user_id INT,
  

  CONSTRAINT fk_playlist_users
  FOREIGN KEY (user_id) REFERENCES users (user_id)
  
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS playlist_entry (

  playlist_id INT PRIMARY KEY,
  song_id INT,
  srank INT,
  
  

  CONSTRAINT fk_playlist_entry_playlist
  FOREIGN KEY (playlist_id) REFERENCES playlist (playlist_id),
  
  CONSTRAINT fk_playlist_entry_song
  FOREIGN KEY (song_id) REFERENCES song (song_id)
  
) ENGINE = InnoDB;