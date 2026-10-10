SET DEFINE OFF
SET SERVEROUTPUT ON
WHENEVER SQLERROR CONTINUE

CREATE USER hotelbooking IDENTIFIED BY hotelbooking
  DEFAULT TABLESPACE users
  TEMPORARY TABLESPACE temp;

ALTER USER hotelbooking IDENTIFIED BY hotelbooking ACCOUNT UNLOCK;
GRANT CONNECT, RESOURCE TO hotelbooking;
ALTER USER hotelbooking QUOTA UNLIMITED ON users;

CONNECT hotelbooking/hotelbooking@XE

CREATE TABLE ohbhotels (
  id NUMBER(4) PRIMARY KEY,
  region VARCHAR2(20) NOT NULL,
  place VARCHAR2(50) NOT NULL,
  name VARCHAR2(80) NOT NULL,
  about VARCHAR2(800),
  type VARCHAR2(20),
  totalrooms NUMBER(4) DEFAULT 0 NOT NULL,
  typeofroom1 VARCHAR2(20),
  typeofroom2 VARCHAR2(20),
  typeofroom3 VARCHAR2(20),
  noofsingleroom NUMBER(3) DEFAULT 0 NOT NULL,
  noofdoubleroom NUMBER(3) DEFAULT 0 NOT NULL,
  noofdeluxeroom NUMBER(3) DEFAULT 0 NOT NULL,
  posingleroom NUMBER(10,2) DEFAULT 0 NOT NULL,
  podoubleroom NUMBER(10,2) DEFAULT 0 NOT NULL,
  podeluxeroom NUMBER(10,2) DEFAULT 0 NOT NULL,
  image VARCHAR2(200)
);

CREATE TABLE ohbblog (
  name VARCHAR2(100) NOT NULL,
  emailid VARCHAR2(100) NOT NULL,
  message VARCHAR2(500) NOT NULL
);

CREATE TABLE ohbusers (
  username VARCHAR2(40) PRIMARY KEY,
  emailid VARCHAR2(100) UNIQUE NOT NULL,
  password VARCHAR2(100) NOT NULL
);

CREATE TABLE ohbadmin (
  userid VARCHAR2(40) PRIMARY KEY,
  password VARCHAR2(100) NOT NULL
);

CREATE TABLE ohbroombook (
  roombookid NUMBER(8) PRIMARY KEY,
  idofhotel NUMBER(4) NOT NULL,
  nameofhotel VARCHAR2(80) NOT NULL,
  placeofhotel VARCHAR2(50) NOT NULL,
  imageofhotel VARCHAR2(200),
  typeofroom VARCHAR2(20) NOT NULL,
  priceofroom NUMBER(10,2) NOT NULL,
  username VARCHAR2(40) NOT NULL,
  emailid VARCHAR2(100) NOT NULL,
  nosroom NUMBER(3) NOT NULL,
  noguest NUMBER(3) NOT NULL,
  nameofguest VARCHAR2(300) NOT NULL,
  checkin VARCHAR2(20) NOT NULL,
  checkout VARCHAR2(20) NOT NULL,
  nonight NUMBER(4) NOT NULL,
  totalamountpay NUMBER(12,2) NOT NULL,
  CONSTRAINT fk_booking_hotel FOREIGN KEY (idofhotel) REFERENCES ohbhotels(id)
);

CREATE SEQUENCE ohb_roombook_seq START WITH 10001 INCREMENT BY 1 NOCACHE;

MERGE INTO ohbadmin target
USING (SELECT 'admin' userid, 'admin123' password FROM dual) source
ON (target.userid = source.userid)
WHEN NOT MATCHED THEN
  INSERT (userid, password) VALUES (source.userid, source.password);

MERGE INTO ohbhotels target
USING (SELECT 1001 id, 'North' region, 'Delhi' place, 'The Imperial Delhi' name,
              'A heritage hotel in central Delhi with comfortable rooms and classic hospitality.' about,
              'Hotel' type, 45 totalrooms, 'Single' room1, 'Double' room2, 'Deluxe' room3,
              15 single_count, 20 double_count, 10 deluxe_count,
              3200 single_price, 4800 double_price, 6900 deluxe_price,
              'themes/images/ladies/1.jpg' image FROM dual) source
ON (target.id = source.id)
WHEN NOT MATCHED THEN INSERT
  (id, region, place, name, about, type, totalrooms, typeofroom1, typeofroom2, typeofroom3,
   noofsingleroom, noofdoubleroom, noofdeluxeroom, posingleroom, podoubleroom, podeluxeroom, image)
VALUES
  (source.id, source.region, source.place, source.name, source.about, source.type, source.totalrooms,
   source.room1, source.room2, source.room3, source.single_count, source.double_count,
   source.deluxe_count, source.single_price, source.double_price, source.deluxe_price, source.image);

MERGE INTO ohbhotels target
USING (SELECT 1002 id, 'West' region, 'Mumbai' place, 'Marine View Residency' name,
              'A modern city hotel close to the waterfront and Mumbai business district.' about,
              'Hotel' type, 54 totalrooms, 'Single' room1, 'Double' room2, 'Deluxe' room3,
              18 single_count, 24 double_count, 12 deluxe_count,
              3600 single_price, 5200 double_price, 7600 deluxe_price,
              'themes/images/ladies/2.jpg' image FROM dual) source
ON (target.id = source.id)
WHEN NOT MATCHED THEN INSERT
  (id, region, place, name, about, type, totalrooms, typeofroom1, typeofroom2, typeofroom3,
   noofsingleroom, noofdoubleroom, noofdeluxeroom, posingleroom, podoubleroom, podeluxeroom, image)
VALUES
  (source.id, source.region, source.place, source.name, source.about, source.type, source.totalrooms,
   source.room1, source.room2, source.room3, source.single_count, source.double_count,
   source.deluxe_count, source.single_price, source.double_price, source.deluxe_price, source.image);

MERGE INTO ohbhotels target
USING (SELECT 1003 id, 'East' region, 'Kolkata' place, 'Bengal Grand Hotel' name,
              'A welcoming city stay inspired by Kolkata heritage and culture.' about,
              'Hotel' type, 42 totalrooms, 'Single' room1, 'Double' room2, 'Deluxe' room3,
              14 single_count, 18 double_count, 10 deluxe_count,
              2800 single_price, 4200 double_price, 6200 deluxe_price,
              'themes/images/ladies/3.jpg' image FROM dual) source
ON (target.id = source.id)
WHEN NOT MATCHED THEN INSERT
  (id, region, place, name, about, type, totalrooms, typeofroom1, typeofroom2, typeofroom3,
   noofsingleroom, noofdoubleroom, noofdeluxeroom, posingleroom, podoubleroom, podeluxeroom, image)
VALUES
  (source.id, source.region, source.place, source.name, source.about, source.type, source.totalrooms,
   source.room1, source.room2, source.room3, source.single_count, source.double_count,
   source.deluxe_count, source.single_price, source.double_price, source.deluxe_price, source.image);

MERGE INTO ohbhotels target
USING (SELECT 1004 id, 'West' region, 'Jaipur' place, 'Pink City Palace' name,
              'A palace-style hotel offering a traditional Rajasthan experience.' about,
              'Hotel' type, 36 totalrooms, 'Single' room1, 'Double' room2, 'Deluxe' room3,
              10 single_count, 16 double_count, 10 deluxe_count,
              3000 single_price, 4500 double_price, 6800 deluxe_price,
              'themes/images/ladies/4.jpg' image FROM dual) source
ON (target.id = source.id)
WHEN NOT MATCHED THEN INSERT
  (id, region, place, name, about, type, totalrooms, typeofroom1, typeofroom2, typeofroom3,
   noofsingleroom, noofdoubleroom, noofdeluxeroom, posingleroom, podoubleroom, podeluxeroom, image)
VALUES
  (source.id, source.region, source.place, source.name, source.about, source.type, source.totalrooms,
   source.room1, source.room2, source.room3, source.single_count, source.double_count,
   source.deluxe_count, source.single_price, source.double_price, source.deluxe_price, source.image);

MERGE INTO ohbhotels target
USING (SELECT 1005 id, 'South' region, 'Bengaluru' place, 'Garden City Suites' name,
              'A practical business hotel with spacious rooms in Bengaluru.' about,
              'Hotel' type, 60 totalrooms, 'Single' room1, 'Double' room2, 'Deluxe' room3,
              20 single_count, 26 double_count, 14 deluxe_count,
              3100 single_price, 4700 double_price, 7100 deluxe_price,
              'themes/images/ladies/5.jpg' image FROM dual) source
ON (target.id = source.id)
WHEN NOT MATCHED THEN INSERT
  (id, region, place, name, about, type, totalrooms, typeofroom1, typeofroom2, typeofroom3,
   noofsingleroom, noofdoubleroom, noofdeluxeroom, posingleroom, podoubleroom, podeluxeroom, image)
VALUES
  (source.id, source.region, source.place, source.name, source.about, source.type, source.totalrooms,
   source.room1, source.room2, source.room3, source.single_count, source.double_count,
   source.deluxe_count, source.single_price, source.double_price, source.deluxe_price, source.image);

MERGE INTO ohbhotels target
USING (SELECT 1006 id, 'South' region, 'Kerala' place, 'Backwater Haven Resort' name,
              'A quiet resort stay near the Kerala backwaters.' about,
              'Resort' type, 32 totalrooms, 'Single' room1, 'Double' room2, 'Deluxe' room3,
              8 single_count, 14 double_count, 10 deluxe_count,
              3400 single_price, 5100 double_price, 7900 deluxe_price,
              'themes/images/ladies/6.jpg' image FROM dual) source
ON (target.id = source.id)
WHEN NOT MATCHED THEN INSERT
  (id, region, place, name, about, type, totalrooms, typeofroom1, typeofroom2, typeofroom3,
   noofsingleroom, noofdoubleroom, noofdeluxeroom, posingleroom, podoubleroom, podeluxeroom, image)
VALUES
  (source.id, source.region, source.place, source.name, source.about, source.type, source.totalrooms,
   source.room1, source.room2, source.room3, source.single_count, source.double_count,
   source.deluxe_count, source.single_price, source.double_price, source.deluxe_price, source.image);

COMMIT;

@@seed_featured.sql

PROMPT HotelBooking database setup complete.
