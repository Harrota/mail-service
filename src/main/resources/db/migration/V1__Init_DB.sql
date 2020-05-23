
create sequence hibernate_sequence start 1 increment 1;

create table letter (
    id int8 not null,
    subject varchar(255) not null,
    text varchar(2048),
    user_id int8,
    destination_user_id int8,
    primary key (id)
);

create table user_role (
    user_id int8 not null,
    roles varchar(255)
);

create table usr (
    id int8 not null,
    active boolean not null,
    email varchar(255) not null,
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

alter table if exists letter
    add constraint letter_user_fk
    foreign key (user_id) references usr;

alter table if exists letter
    add constraint letter_destination_user_fk
    foreign key (destination_user_id) references usr;

alter table if exists user_role
    add constraint role_user_fk
    foreign key (user_id) references usr;