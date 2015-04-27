psql

CREATE DATABASE restaurant;
\c restaurant;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(255),
  password_hash VARCHAR(255),
  manager_id INTEGER
);

CREATE TABLE managers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  password_hash VARCHAR(255)
);

CREATE TABLE parties (
  id SERIAL PRIMARY KEY,
  table_num INTEGER,
  guest INTEGER,
  payment BOOLEAN NOT NULL DEFAULT FALSE,
  user_id INTEGER,
  manager_id INTEGER
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
  partie_id INTEGER REFERENCES parties(id),
  food_id INTEGER REFERENCES foods(id)
  );

  CREATE TABLE recipts (
    id SERIAL PRIMARY KEY,
    to_date DATE,
    order_id INTEGER REFERENCES orders(id)
  );
