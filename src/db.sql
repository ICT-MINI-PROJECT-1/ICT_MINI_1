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

CREATE TABLE IF NOT EXISTS `artpart`.`room` (
  `roomno` INT NOT NULL,
  `roomconcept` VARCHAR(45) NOT NULL,
  `roominfo` VARCHAR(200),
  `price` INT NOT NULL,
  `bedtype` VARCHAR(45) NOT NULL,
  `viewtype` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `area` INT NOT NULL,
  `checkin` VARCHAR(10) NULL DEFAULT '15:00',
  `checkout` VARCHAR(10) NULL DEFAULT '11:00',
  `rating` FLOAT NULL,
  PRIMARY KEY (`roomno`));

CREATE TABLE IF NOT EXISTS `artpart`.`reservation` (
  `reservno` INT NOT NULL AUTO_INCREMENT,
  `reservdate` DATETIME NOT NULL DEFAULT now(),
  `reservenddate` DATETIME NOT NULL DEFAULT now(),
  `usercnt` INT NOT NULL,
  `request` VARCHAR(500) NULL,
  `userid` VARCHAR(20) NOT NULL,
  `roomno` INT NOT NULL,
  PRIMARY KEY (`reservno`),
  INDEX `fk_reservation_user1_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `fk_reservation_user1`
    FOREIGN KEY (`userid`)
    REFERENCES `artpart`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_room1`
    FOREIGN KEY (`roomno`)
    REFERENCES `artpart`.`room` (`roomno`)
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

DELIMITER $$
	create trigger insert_review
	after insert
	on review
	for each row
	begin
		UPDATE room SET rating = 
		(select sum(rating)/count(rating) from review where roomno=new.roomno) where roomno=new.roomno;
    END $$
DELIMITER ;

DELIMITER $$
	create trigger update_review
	after update
	on review
	for each row
	begin
		UPDATE room SET rating = 
		(select sum(rating)/count(rating) from review where roomno=new.roomno) where roomno=new.roomno;
    END $$
DELIMITER ;

insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area) values(301,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',200000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(302,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',205000,'double','view',4,21);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(303,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',150000,'single','view',2,14);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(304,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',190000,'single','view',3,18);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(305,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',250000,'queen','view',6,27);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(306,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',230000,'queen','view',6,25);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(307,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',180000,'single','view',3,17);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(308,'contemp','안녕하세요\n반갑습니다\n설명입니다\n',200000,'double','view',4,20);

insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(401,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',180000,'single','view',3,18);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(402,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',200000,'double','view',4,21);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(403,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',210000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(404,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',185000,'single','view',3,17);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(405,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',195000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(406,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',215000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(407,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',220000,'queen','view',6,25);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(408,'artnou','안녕하세요\n반갑습니다\n설명입니다\n',250000,'queen','view',7,28);

insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(501,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',180000,'single','view',3,18);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(502,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',200000,'double','view',4,19);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(503,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',210000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(504,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',185000,'single','view',3,18);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(505,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',190000,'single','view',3,19);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(506,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',250000,'queen','view',7,28);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(507,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',230000,'queen','view',6,24);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(508,'artdec','안녕하세요\n반갑습니다\n설명입니다\n',215000,'double','view',4,20);

insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(601,'asian','안녕하세요\n반갑습니다\n설명입니다\n',200000,'double','view',4,19);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(602,'asian','안녕하세요\n반갑습니다\n설명입니다\n',200000,'double','view',4,19);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(603,'asian','안녕하세요\n반갑습니다\n설명입니다\n',210000,'single','view',3,19);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(604,'asian','안녕하세요\n반갑습니다\n설명입니다\n',185000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(605,'asian','안녕하세요\n반갑습니다\n설명입니다\n',190000,'single','view',3,19);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(606,'asian','안녕하세요\n반갑습니다\n설명입니다\n',250000,'single','view',3,18);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(607,'asian','안녕하세요\n반갑습니다\n설명입니다\n',210000,'double','view',4,20);
insert into room(roomno,roomconcept,roominfo,price,bedtype,viewtype,capacity,area)  values(608,'asian','안녕하세요\n반갑습니다\n설명입니다\n',215000,'double','view',4,20);


insert into user values('test1234','test1234!!','이건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('user1234','user1234!!','김건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test1111','test1111!!','삼건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test2222','test2222!!','사건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test3222','test3222!!','오건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test4222','test4222!!','육건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test5222','test5222!!','칠건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test6222','test6222!!','팔건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('test7222','test7222!!','구건모','010-6385-4676','rjsah5676@naver.com',13473,'경기 성남시','어딘가','1233-1233-1212-1212');
insert into user values('admin','admin','관리자','0','0',0,'0','0','0');

insert into reservation(reservdate,reservenddate,usercnt,request,userid,roomno) values('2025-03-01','2025-03-03',2,'냠냠','test1111',301);
insert into reservation(reservdate,reservenddate,usercnt,request,userid,roomno) values('2025-03-07','2025-03-09',2,'냠냠','test2222',301);
insert into reservation(reservdate,reservenddate,usercnt,request,userid,roomno) values('2025-03-11','2025-03-11',2,'냠냠','test3222',301);
insert into reservation(reservdate,reservenddate,usercnt,request,userid,roomno) values('2025-03-31','2025-03-31',2,'냠냠','test4222',301);
insert into reservation(reservdate,reservenddate,usercnt,request,userid,roomno) values('2025-02-22','2025-02-23',2,'냠냠','test1234',301);

insert into wishlist values('test1234',301);

insert into wishlist values('test1234',304);

alter table room modify column roominfo varchar(1000);

UPDATE room SET 
    roomconcept = 'contemp',
    roominfo ='정원: 4명(최대 6인)\n베드: 킹 베드 2개 또는 킹 베드 1개와 더블 베드 2개\n 엑스트라 베드 제공 가능\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 별도의 업무 공간,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n85인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 1350000,
    bedtype = '스위트',
    viewtype = '시티뷰',
    capacity = 6,
    area = 206
WHERE roomno = 301;



UPDATE room
SET 
    roomconcept = 'contemp',
    roominfo = '정원: 2명(최대 4인)\n베드: Q 베드 2개 또는 Q 베드 1개와 SS 베드 2개\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n75인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 480000,
    bedtype = '프리미어',
    viewtype = '시티뷰',
    capacity = 4,
    area = 115
WHERE roomno IN (302, 303, 304);



UPDATE room
SET 
    roomconcept = 'contemp',
    roominfo = '정원: 2명(최대 2인)\n베드: Q 베드 개 또는 D 베드 2개\n\n특별한 공간:\n
별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n65인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 330000,
    bedtype = '디럭스',
    viewtype = '마운틴뷰',
    capacity = 2,
    area = 75
WHERE roomno IN (305, 306, 307,308);



UPDATE room SET 
    roomconcept = 'artnou',
    roominfo = '정원: 4명(최대 6인)\n베드: 킹 베드 2개 또는 킹 베드 1개와 더블 베드 2개\n 엑스트라 베드 제공 가능\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 별도의 업무 공간,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n85인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 1350000,
    bedtype = '스위트',
    viewtype = '시티뷰',
    capacity = 6,
    area = 206
WHERE roomno = 401;



UPDATE room
SET 
    roomconcept = 'artnou',
    roominfo = '정원: 2명(최대 4인)\n베드: Q 베드 2개 또는 Q 베드 1개와 SS 베드 2개\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n75인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 480000,
    bedtype = '프리미어',
    viewtype = '시티뷰',
    capacity = 4,
    area = 115
WHERE roomno IN (402, 403, 404);



UPDATE room
SET 
    roomconcept = 'artnou',
    roominfo = '정원: 2명(최대 2인)\n베드: Q 베드 개 또는 D 베드 2개\n\n특별한 공간:\n
별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n65인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 330000,
    bedtype = '디럭스',
    viewtype = '마운틴뷰',
    capacity = 2,
    area = 75
WHERE roomno IN (405, 406, 407, 408);


UPDATE room SET 
    roomconcept = 'artdec',
    roominfo ='정원: 4명(최대 6인)\n베드: 킹 베드 2개 또는 킹 베드 1개와 더블 베드 2개\n 엑스트라 베드 제공 가능\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 별도의 업무 공간,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n85인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 1350000,
    bedtype = '스위트',
    viewtype = '시티뷰',
    capacity = 6,
    area = 206
WHERE roomno = 501;



UPDATE room
SET 
    roomconcept = 'artdec',
    roominfo = '정원: 2명(최대 4인)\n베드: Q 베드 2개 또는 Q 베드 1개와 SS 베드 2개\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n75인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 480000,
    bedtype = '프리미어',
    viewtype = '시티뷰',
    capacity = 4,
    area = 115
WHERE roomno IN (502, 503, 504);



UPDATE room
SET 
    roomconcept = 'artdec',
    roominfo = '정원: 2명(최대 2인)\n베드: Q 베드 개 또는 D 베드 2개\n\n특별한 공간:\n
별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n65인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 330000,
    bedtype = '디럭스',
    viewtype = '마운틴뷰',
    capacity = 2,
    area = 75
WHERE roomno IN (505, 506, 507, 508);



UPDATE room SET 
    roomconcept = 'asian',
    roominfo ='정원: 4명(최대 6인)\n베드: 킹 베드 2개 또는 킹 베드 1개와 더블 베드 2개\n 엑스트라 베드 제공 가능\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 별도의 업무 공간,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n85인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 1350000,
    bedtype = '스위트',
    viewtype = '시티뷰',
    capacity = 6,
    area = 206
WHERE roomno = 601;



UPDATE room
SET 
    roomconcept = 'asian',
    roominfo = '정원: 2명(최대 4인)\n베드: Q 베드 2개 또는 Q 베드 1개와 SS 베드 2개\n\n특별한 공간:\n별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n75인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 480000,
    bedtype = '프리미어',
    viewtype = '시티뷰',
    capacity = 4,
    area = 115
WHERE roomno IN (602, 603, 604);



UPDATE room
SET 
    roomconcept = 'asian',
    roominfo ='정원: 2명(최대 2인)\n베드: Q 베드 개 또는 D 베드 2개\n\n특별한 공간:\n
별도의 현관, 팬트리 공간, 4인용 다이닝 테이블,\n 호텔 서비스 접속을 위한 iPad Mini\n\n객실 하이라이트:\n65인치 스마트 TV(위성 TV 48개 채널)\n맞춤형 침대-Hard, Midium, Soft 3가지 토퍼 제공\n거위털 이불 및 베개\n',
    price = 330000,
    bedtype = '디럭스',
    viewtype = '마운틴뷰',
    capacity = 2,
    area = 75
WHERE roomno IN (605, 606, 607, 608);


ALTER TABLE reviewimg MODIFY imgno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE reviewimg DROP COLUMN image;
alter table reviewimg add filename varchar(45);

commit;