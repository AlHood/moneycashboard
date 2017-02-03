DROP TABLE transactions CASCADE; 
DROP TABLE tags CASCADE;
DROP TABLE users CASCADE;


CREATE TABLE transactions (
id SERIAL8 primary key, 
merchant VARCHAR(255),
tag_id INT8 REFERENCES tags(id),
value INT8 
-- date (but not yet)
);





CREATE TABLE tags (
id serial8 primary key

);














