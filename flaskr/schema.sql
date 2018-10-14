DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS post;
DROP TABLE IF EXISTS admin;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS diagnosis;
DROP TABLE IF EXISTS medicinestock;
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS medicine;
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS register;
DROP TABLE IF EXISTS pharmacy;

CREATE TABLE admin (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  status TEXT
);

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

CREATE TABLE employee (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  office TEXT NOT NULL,
  status TEXT
);

CREATE TABLE diagnosis (
  id INTEGER,
  pathographyid TEXT NOT NULL,
  history TEXT,
  allergy TEXT,
  symptom TEXT,
  analysis TEXT,
  user_id INTEGER,
  PRIMARY KEY (id, pathographyid)
);

CREATE TABLE medicinestock (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  medicine_id INTEGER,
  total INTEGER,
  times TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE patient (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  pathographyid TEXT, 
  name TEXT UNIQUE NOT NULL,
  sex TEXT,
  age INTEGER,
  address TEXT,
  office TEXT
);

CREATE TABLE medicine (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  spec TEXT,
  factory TEXT,
  price REAL,
  stock INTEGER,
  total INTEGER,
  description TEXT,
  flay INTEGER
);

CREATE TABLE office (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE pharmacy (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  pathographyid TEXT, 
  medicine_id INTEGER,
  times_s TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  times_e TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER
);

CREATE TABLE register (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  office TEXT,
  price REAL
);
  
CREATE TABLE post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);
