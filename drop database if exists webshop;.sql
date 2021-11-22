drop database if exists webshop;
create database webshop;
use webshop;

create table artikli(
    sifra       int not null primary key auto_increment,
    naziv       varchar(50),
    cijena      decimal(20,2),
    stanje      boolean
);

create table osoba(
    prodavac        int not null,
    administrator   int not null,
    kupac           int not null
);

create table lokacija(
    adresa      varchar(50),
    email       varchar(50),
    telefon     varchar(50)
);

create table prodavac(
    sifra       int not null primary key auto_increment,
    oib         char(11),
    email       varchar(50),
    ime         varchar(50),
    prezime     varchar(50),
    iban        varchar(50)
);

create table administrator(
    sifra       int not null primary key auto_increment,
    oib         char(11),
    email       varchar(50),
    ime         varchar(50),
    prezime     varchar(50),
    iban        varchar(50)
);

create table kupac(
    sifra       int not null primary key auto_increment,
    ime         varchar(50),
    prezime     varchar(50),
    adresa      varchar(50),
    placanje    varchar(50)
);

alter table osoba add foreign key (prodavac) references prodavac(sifra);
alter table osoba add foreign key (administrator) references administrator(sifra);
alter table osoba add foreign key (kupac) references kupac(sifra);

