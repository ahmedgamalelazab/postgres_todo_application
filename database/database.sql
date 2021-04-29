-- this will be the sql commands that related to our data base all the queries i will put them all here 

--CREATE DATABASE toDoo;

CREATE TABLE todo(
    todo_id SERIAL PRIMARY KEY NOT NULL ,
    describtion VARCHAR(225)
);

--creating the users data base 

   
CREATE TABLE user ( 
	user_id Character Varying( 150 ) DEFAULT REPLACE(gen_random_uuid()::text,'-','') NOT NULL,
	userName Character Varying( 50 ) NOT NULL,
	userEmail Character Varying( 150 ) NOT NULL,
	userPassword Character Varying( 150 ) NOT NULL,
    PRIMARY KEY ( user_id ),
	CONSTRAINT unique_user_user_id UNIQUE( "user_id" ),
	CONSTRAINT unique_user_userEmail UNIQUE( "userEmail" ) );


--INSERT INTO "public"."user" ( "userName", "userEmail", "userPassword") 
--VALUES ( <userName>, <userEmail>, <userPassword> );