psql

CREATE DATABASE restaurant;
\c restaurant;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  password_hash VARCHAR(255)
);

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  table_num INTEGER,
  guest INTEGER,
  payment BOOLEAN,
  user_id INTEGER
  );

CREATE TABLE foods (
  id SERIAL PRIMARY KEY,
  meal_type TEXT,
  name TEXT,
  allergiens TEXT,
  price MONEY
  );

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  logo VARCHAR(255),
  address VARCHAR(255),
  to_date DATE,
  partie_id INTEGER,
  food_id INTEGER
  );
