create database if not exists QUANLYDIEMTHI;
use QUANLYDIEMTHI;

create table if not exists student(
    studentId varchar(4) not null primary key ,
    studentName varchar(100) not null ,
    birthday date not null ,
    gender bit not null ,
    address text not null ,
    phoneNumber varchar(45) unique
);

create table if not exists subject (
    subjectId varchar(4) not null primary key ,
    subjectName varchar(45) not null ,
    priority int not null
);

create table if not exists mark(
    studentId varchar(4) not null ,
    subjectId varchar(4) not null ,
    point float not null
);

alter table mark
add foreign key (studentId) references student(studentId),
    add foreign key (subjectId) references subject(subjectId);


