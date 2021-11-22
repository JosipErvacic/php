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
    sifra       int not null primary key auto_increment,
    oib         char(11),
    email       varchar(50),
    ime         varchar(50),
    prezime     varchar(50),
    iban        varchar(50)
);

create table lokacija(
    adresa      varchar(50),
    email       varchar(50),
    telefon     varchar(50)
);

create table prodavac(
    sifra       int not null primary key auto_increment,
    osoba       int not null
);

create table administrator(
    sifra       int not null primary key auto_increment,
    osoba       int not null
);


alter table prodavac add foreign key (osoba) references osoba(sifra);
alter table administrator add foreign key (osoba) references osoba(sifra);

insert into osoba(sifra,oib,email,ime,prezime,iban)
values 
(null,'26475874657','administrator42@gmail.com','Martina','Martinić',null),
(null,'12345678911',null,'Ivan','Ivić',null),
(null,'23147569873','Matija123@gmail.com','Matija','Matijevič',null);

insert into prodavac(sifra,osoba)
values
(null,2),
(null,3);

insert into administrator(sifra,osoba)
values (null,1);

insert into lokacija(adresa,email,telefon)
values ('Strossmayerova 67','trgovina1234@gmail.com','011/245-678');





