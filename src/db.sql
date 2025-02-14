drop database if exists artpart;
create database artpart;

use artpart;


CREATE TABLE IF NOT EXISTS `artpart`.`user` (
  `userid` VARCHAR(20) NOT NULL,
  `userpw` VARCHAR(20) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `tel` VARCHAR(13) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `zipcode` INT NOT NULL,
  `addr` VARCHAR(100) NOT NULL,
  `addrdetail` VARCHAR(100) NOT NULL,
  `creditcardno` VARCHAR(19) NULL,
  PRIMARY KEY (`userid`));

insert into user values('user1234','user1234','�씠嫄대え','010-1234-5678','rjsah5676@gmail.com',12345,'�궛�꽦��濡�383踰덇만 27','A�룞 303�샇','1000-2000-3000-4000');

CREATE TABLE IF NOT EXISTS `artpart`.`reservation` (
  `reservno` INT NOT NULL,
  `reservdate` DATETIME NOT NULL DEFAULT now(),
  `usercnt` INT NOT NULL,
  `request` VARCHAR(500) NULL,
  `userid` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`reservno`),
  INDEX `fk_reservation_user1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_user1`
    FOREIGN KEY (`userid`)
    REFERENCES `artpart`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `artpart`.`room` (
  `roomno` INT NOT NULL,
  `roomconcept` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `bedtype` VARCHAR(45) NOT NULL,
  `viewtype` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `area` INT NOT NULL,
  `reservno` INT NULL,
  `checkin` VARCHAR(10) NULL DEFAULT '15:00',
  `checkout` VARCHAR(10) NULL DEFAULT '11:00',
  `rating` FLOAT NULL,
  PRIMARY KEY (`roomno`),
  INDEX `fk_room_reservation1_idx` (`reservno` ASC) VISIBLE,
  CONSTRAINT `fk_room_reservation1`
    FOREIGN KEY (`reservno`)
    REFERENCES `artpart`.`reservation` (`reservno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `artpart`.`wishlist` (
  `userid` VARCHAR(20) NOT NULL,
  `roomno` INT NOT NULL,
  INDEX `fk_wishlist_user1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_wishlist_room1_idx` (`roomno` ASC) VISIBLE,
  PRIMARY KEY (`userid`, `roomno`),
  CONSTRAINT `fk_wishlist_user1`
    FOREIGN KEY (`userid`)
    REFERENCES `artpart`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_wishlist_room1`
    FOREIGN KEY (`roomno`)
    REFERENCES `artpart`.`room` (`roomno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `artpart`.`review` (
  `reviewno` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(45) NOT NULL,
  `writedate` DATETIME NULL DEFAULT now(),
  `content` VARCHAR(500) NOT NULL,
  `userid` VARCHAR(20) NOT NULL,
  `roomno` INT NOT NULL,
  `rating` FLOAT NULL,
  PRIMARY KEY (`reviewno`),
  INDEX `fk_review_user1_idx` (`userid` ASC) VISIBLE,
  INDEX `fk_review_room1_idx` (`roomno` ASC) VISIBLE,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`userid`)
    REFERENCES `artpart`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_room1`
    FOREIGN KEY (`roomno`)
    REFERENCES `artpart`.`room` (`roomno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `artpart`.`reviewimg` (
  `imgno` INT NOT NULL,
  `reviewno` INT NOT NULL,
  `image` BLOB NOT NULL,
  PRIMARY KEY (`imgno`),
  INDEX `fk_reviewimg_review1_idx` (`reviewno` ASC) VISIBLE,
  CONSTRAINT `fk_reviewimg_review1`
    FOREIGN KEY (`reviewno`)
    REFERENCES `artpart`.`review` (`reviewno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(301,'contemp',200000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(302,'contemp',205000,'double','view',4,21);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(303,'contemp',150000,'single','view',2,14);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(304,'contemp',190000,'super_single','view',3,18);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(305,'contemp',250000,'queen','view',6,27);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(306,'contemp',230000,'queen','view',6,25);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(307,'contemp',180000,'super_single','view',3,17);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(308,'contemp',200000,'double','view',4,20);

insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(401,'artnou',180000,'super_single','view',3,18);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(402,'artnou',200000,'double','view',4,21);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(403,'artnou',210000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(404,'artnou',185000,'single','view',3,17);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(405,'artnou',195000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(406,'artnou',215000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(407,'artnou',220000,'queen','view',6,25);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(408,'artnou',250000,'queen','view',7,28);

insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(501,'artdec',180000,'super_single','view',3,18);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(502,'artdec',200000,'double','view',4,19);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(503,'artdec',210000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(504,'artdec',185000,'super_single','view',3,18);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(505,'artdec',190000,'single','view',3,19);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(506,'artdec',250000,'queen','view',7,28);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(507,'artdec',230000,'queen','view',6,24);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(508,'artdec',215000,'double','view',4,20);

insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(601,'asian',200000,'double','view',4,19);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(602,'asian',200000,'double','view',4,19);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(603,'asian',210000,'single','view',3,19);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(604,'asian',185000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(605,'asian',190000,'single','view',3,19);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(606,'asian',250000,'super_single','view',3,18);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(607,'asian',210000,'double','view',4,20);
insert into room(roomno,roomconcept,price,bedtype,viewtype,capacity,area) values(608,'asian',215000,'double','view',4,20);
commit;