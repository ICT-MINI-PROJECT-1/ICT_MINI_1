create database artpart;

use artpart;

create table user (
	userid varchar(30) primary key,
    userpw varchar(30) not null,
	username varchar(30) not null unique
);