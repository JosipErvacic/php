drop database if exists webshop;
create database webshop;
use webshop;

create table artikli(
    sifra       int not null primary key auto_increment,
    naziv       varchar(50),
    cijena      decimal(20,2),
    kolicina    char(10)
);

create table kupac(
    sifra       int not null primary key auto_increment,
    lokacija    varchar(50),
    ime         varchar(50),
    prezime     varchar(50)
);

create table narudba(
    sifra           int not null primary key auto_increment,
    kupac           int not null,
    datumnarudbe    datetime not null,
    placanje        int not null,
    adresa          varchar(50),
    telefon         varchar(50)
);

create table placanje(
    sifra       int not null primary key auto_increment,
    vrsta       varchar(50)
);

create table kosarica(
    cijena      decimal(20,2),
    sifra       int not null primary key auto_increment,
    artikli     int not null,
    kolicina    char(3) not null,
    narudba     int not null
);

alter table narudba add foreign key (kupac) references kupac(sifra);
alter table kosarica add foreign key (narudba) references narudba(sifra);
alter table narudba add foreign key (placanje) references placanje(sifra);
alter table kosarica add foreign key (artikli) references artikli(sifra);




