DROP TABLE transactions CASCADE; 
DROP TABLE tags CASCADE;
DROP TABLE users CASCADE;



CREATE TABLE tags (
id serial8 primary key,
tag_name VARCHAR(255)

);


CREATE TABLE transactions (
id SERIAL8 primary key, 
merchant VARCHAR(255),
tag_id INT8 REFERENCES tags(id) ON DELETE CASCADE,
value INT8 
day INT4
month INT4
year INT4 
-- date (but not yet)
);





CREATE TABLE users(
funds INT8,
budget INT8
);












