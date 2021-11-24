drop database if exists webshop;
create database webshop;
use webshop;

create table artikli(
    sifra       int not null primary key auto_increment,
    naziv       varchar(50),
    cijena      decimal(20,2),
    kolicina    char(10)
);

create table osoba(
    sifra       int not null primary key auto_increment,
    oib         char(11),
    email       varchar(50),
    ime         varchar(50),
    prezime     varchar(50),
    iban        varchar(50)
);

create table lokacija(
    sifra       int not null primary key auto_increment,
    adresa      varchar(50),
    telefon     varchar(50)
);

create table prodavac(
    sifra       int not null primary key auto_increment,
    osoba       int not null
);

create table kupac(
    sifra       int not null primary key auto_increment,
    osoba       int not null,
    lokacija    int not null
);

create table narudba(
    sifra           int not null primary key auto_increment,
    kupac           int not null,
    iznos           decimal(20,2) not null,
    datumnarudbe    datetime not null,
    placanje        int not null
);

create table placanje(
    sifra       int not null primary key auto_increment,
    vrsta       varchar(50)
);

create table kosarica(
    sifra       int not null primary key auto_increment,
    artikli     int not null,
    kolicina    char(3) not null,
    narudba     int not null
);


alter table prodavac add foreign key (osoba) references osoba(sifra);
alter table kupac add foreign key (osoba) references osoba(sifra);
alter table narudba add foreign key (kupac) references kupac(sifra);
alter table kosarica add foreign key (narudba) references narudba(sifra);
alter table narudba add foreign key (placanje) references placanje(sifra);
alter table kupac add foreign key (lokacija) references lokacija(sifra);
alter table kosarica add foreign key (artikli) references artikli(sifra);

insert into osoba(sifra,oib,email,ime,prezime,iban)
values 
(null,'12345678911',null,'Ivan','Ivić',null),
(null,'23147569873','Matija123@gmail.com','Matija','Matijevič',null);

insert into prodavac(sifra,osoba)
values
(null,2),
(null,3);





