
DROP TABLE flowers;
DROP TABLE plants;
DROP TABLE origin;


CREATE TABLE origin (
  id SERIAL4 PRIMARY KEY,
  origin_name VARCHAR(255)
);

CREATE TABLE flowers (
  id SERIAL4 PRIMARY KEY,
  flower_name VARCHAR(255),
  quantity INT8,
  origin_id int4 REFERENCES origin(id)
  buy_price INT8
  sell_price INT8

);

CREATE TABLE plants (
  id SERIAL4 PRIMARY KEY,
  plant_name VARCHAR(255),
  quantity INT8,
 origin_id int4 REFERENCES origin(id)
 buy_price INT8
 sell_price INT8

);
