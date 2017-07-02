/*------------------------------------------------------------------------------------------ 
Database and SQL course Item 17 Drills

	Student: Tony Bateman
--------------------------------------------------------------------------------------------*/



USE db_zoo

/* DRILL 1: ALL INFO FROM HABITAT TABLE */

SELECT * FROM tbl_habitat;

/* DRILL 2: RETRIEVE ALL NAMES FROM SPECIES_COLUMN WITH SPECIES_ORDER == 3 */

SELECT species_name	FROM tbl_species WHERE species_order = 3;

/*	DRILL 3: RETRIEVE NUTRITION TYPE FROM NUTRITION TABLE WHEN COST IS $600 OR LESS */

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

/* DRILL 4: RETRIEVE ALL SPECIES_NAMES WITH NUTRITION_ID BETWEE 2202 AND 2206 FROM NUTRITION TABLE */

SELECT species_name FROM tbl_species WHERE species_nutrition>2201 AND species_nutrition <2207;

/*	DRILL 5: RETRIEVE ALL NAMES IN THE SPECIES_NAME COLUMN USING THE ALIAS 'SPECIES NAME:" FROM THE SPECIES_TABLE THE NUTRITION_TYPE 
			 UNDER THE ALIAS OF "NUTRITION TYPE" " FROM THE NUTRITION TABLE */

SELECT a.species_name AS 'Species Name:', b.nutrition_type AS 'Nutrition Type:' FROM tbl_species as a INNER JOIN tbl_nutrition as b ON a.species_nutrition = b.nutrition_id;


/* DRILL 6: RETRIEVE THE FIRST AND LAST NAME AND CONTACT NUMBER OF ANY SPECIALISH IF THEY MOLYCODDLE PENGUINS */
/* THIS WILL INVOLVE THE SPECIALIST TABLE, THE SPECIES TABLE AND THE CARE TABLE */

select t.specialist_fname as 'First Name: ', t.specialist_lname as 'Last Name: ', t.specialist_contact as 'Contact Number: ' from tbl_specialist as t inner join (tbl_care as c inner join tbl_species as s on c.care_id=s.species_care and species_name='penguin') on t.specialist_id=c.care_specialist;

/* ANSWER: margret	nyguen	384-576-2899 */

/* DRILL 6: RETRIEVE THE FIRST AND LAST NAME AND CONTACT NUMBER OF ANY SPECIALISH IF THEY MOLYCODDLE PENGUINS */
/* THIS WILL INVOLVE THE SPECIALIST TABLE, THE SPECIES TABLE AND THE CARE TABLE */

select t.specialist_fname as 'First Name: ', t.specialist_lname as 'Last Name: ', t.specialist_contact as 'Contact Number: ' from tbl_specialist as t inner join (tbl_care as c inner join tbl_species as s on c.care_id=s.species_care and species_name='penguin') on t.specialist_id=c.care_specialist;

/* ANSWER: margret	nyguen	384-576-2899 */


/* DRILL 7:	create a two table database. Assign a foreign key constraint to one of the tables. Create a statement that queries data from both tables. */
/* I think I will make a table that contains first and last names, and a table that contains their favorite tree, color, and movie. I'll create a query that gets 
   first name and favorite movie. */

   CREATE DATABASE db_myFavorites
   use db_myFavorites

   CREATE TABLE tbl_Names
		(name_id INT PRIMARY KEY NOT NULL IDENTITY(1000,10),
		 name_fname VARCHAR(50) NOT NULL,
		 name_lname varchar(50) NOT NULL);

   CREATE TABLE tbl_favs
		(fav_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		 favs_ownerID INT NOT NULL CONSTRAINT fk_name_id FOREIGN KEY REFERENCES tbl_names(name_id) ON UPDATE CASCADE ON DELETE CASCADE,
		 fav_favTree VARCHAR(50) NOT NULL,
		 fav_favColor VARCHAR(25) NULL,
		 fav_favMovie VARCHAR(25) NOT NULL);

	INSERT INTO tbl_Names
		(name_fname, name_lname)
	VALUES
		('Fred', 'Flintstone'),
		('Derek', 'Flint'),
		('Wade', 'Wilson'),
		('Yun-Mi','Huh'),
		('Mina','Oh'),
		('Caroline','Parsons');

	INSERT INTO tbl_favs
		(favs_ownerID,fav_favTree,fav_favColor,fav_favMovie)
	VALUES
		(1000,'Larch','Ivory','Viva Rock Vegas'),
		(1010,'Oak','Crimson','In Like Flint'),
		(1020,'Birch','Red','Dead Pool'),
		(1030,'Cherry','White','Cloud Atlas'),
		(1040,'Cherry','Green','Cloud Atlas'),
		(1050,'Dogwood','Yellow','Life of Brian');

	SELECT a.name_fname, b.fav_favMovie FROM tbl_names a inner join tbl_favs b ON a.name_id=b.favs_ownerID WHERE a.name_lname = 'Wilson';
	
	/* Result: Wade Dead Pool */
