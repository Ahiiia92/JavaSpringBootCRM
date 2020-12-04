DROP TABLE contacts CASCADE CONSTRAINTS;
-- DELETE FROM contacts WHERE city=null;

DROP TABLE sales_admin CASCADE CONSTRAINTS;

CREATE TABLE
    contacts (
                 contact_id NUMBER(6) PRIMARY KEY,
                 firstname VARCHAR(50),
                 lastname VARCHAR2(50),
                 email VARCHAR2(50),
                 address VARCHAR2(50),
                 zipCode VARCHAR2(50),
                 city VARCHAR2(50),
                 user_id NUMBER(6)
                    CONSTRAINT user_contr_fk
                    FOREIGN KEY(user_id) REFERENCES sales_admin(user_id)
)
;

CREATE TABLE
    sales_admin (
                    user_id NUMBER(6) PRIMARY KEY,
                    firstname VARCHAR(50),
                    lastname VARCHAR2(50),
                    username VARCHAR2(50),
                    password VARCHAR2(50),
                    role VARCHAR2(50)
)
;
--
-- INSERT INTO contacts (contact_id, firstname, lastname, email, address, zipcode, city, user_id)
-- VALUES (1, 'Marry', 'John', 'marry.john@gmail.com', 'rue de léglise', '56535', 'berlin', 1);
--
-- INSERT INTO contacts (contact_id, firstname, lastname, email, address, zipcode, city, user_id)
-- VALUES (2, 'Jonny', 'John', 'john@gmail.com', 'rue du jardin', '34568', 'paris', 3);
--
-- INSERT INTO contacts (contact_id, firstname, lastname, email, address, zipcode, city, user_id)
-- VALUES (3, 'Jean', 'Dupont', 'jean@gmail.com', 'rue des magnolia', '34568', 'troyes', 2);
--
-- INSERT INTO contacts (contact_id, firstname, lastname, email, address, zipcode, city, user_id)
-- VALUES (4, 'Suzanne', 'Pierre', 'suz@gmail.com', 'rue du pont', '97428', 'bordeaux', 1);
--
-- INSERT INTO sales_admin (user_id, firstname, lastname, username, password, role)
-- VALUES (1, 'maroussia', 'arnault', 'marou', '123456', 'manager');
--
-- INSERT INTO sales_admin (user_id, firstname, lastname, username, password, role)
-- VALUES (2, 'tristan', 'arnault', 'titi', '123456', 'sales');
--
-- INSERT INTO sales_admin (user_id, firstname, lastname, username, password, role)
-- VALUES (3, 'bianca', 'herbst', 'biancacita', '123456', 'sales');