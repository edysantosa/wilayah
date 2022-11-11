create table provinsi (
    id varchar(13),
    kode varchar(50) not null,
    nama varchar(255) not null,
    primary key (id)
);

create table kabupaten_kota (
    id varchar(13),
    id_provinsi varchar(13) not null,
    nama varchar(255) not null,
    primary key (id),
    foreign key (id_provinsi) references provinsi(id)
);

create table kecamatan (
    id varchar(13),
    id_kabupaten_kota varchar(13) not null,
    nama varchar(255) not null,
    primary key (id),
    foreign key (id_kabupaten_kota) references kabupaten_kota(id)
);

create table kelurahan (
    id varchar(13),
    id_kecamatan varchar(13) not null,
    nama varchar(255) not null,
    primary key (id),
    foreign key (id_kecamatan) references kecamatan(id)
);


insert into provinsi (id, nama)
select kode as id, nama from wilayah where length(kode) = 2;

insert into kabupaten_kota (id, id_provinsi, nama)
select kode as id, substring(kode, 1, 2) as id_provinsi, nama from wilayah where length(kode) = 5;

insert into kecamatan (id, id_kabupaten_kota, nama)
select kode as id, substring(kode, 1, 5) as id_kabupaten_kota, nama from wilayah where length(kode) = 8;

insert into kelurahan (id, id_kecamatan, nama)
select kode as id, substring(kode, 1, 8) as id_kecamatan, nama from wilayah where length(kode) = 13;

