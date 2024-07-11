/* COUNTRY */
INSERT INTO country (name, continent)
VALUES ('FRANCE', 'EUROPE');

/* ARTIST */
INSERT INTO artist (last_name, first_name, DOB)
VALUES ('VAN GOGH', 'VINCENT', '1853-05-30');

/* ARTWORK */
INSERT INTO artwork (artist_id, title, year, period, description, type, location, donated, file)
VALUES (1, 'Starry Night 2', 1889, 1, '', 1, 1, 0, 'starry_night.jpg');

/* List all artwork entries*/
SELECT artist_id, title, year, period, description, type, location, donated, file
FROM artwork;

UPDATE artwork
SET title = 'Starry Night', year = 1889
WHERE artist_id = 1;

DELETE from artwork
WHERE artwork_id = 1;

/* KEYBRIDGE */
INSERT INTO keybridge (keyword_id, artwork_id) values (?, ?);

/* KEYWORD */
INSERT INTO keyword (keyword) values ('blind');
INSERT INTO keyword (keyword) values ('man');
INSERT INTO keyword (keyword) values ('violence');
INSERT INTO keyword (keyword) values ('Samson');



