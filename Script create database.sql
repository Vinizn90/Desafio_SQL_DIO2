create database oficina_mecanica;
use oficina_mecanica;


create table clients(
	ClientId int auto_increment primary key,
    Cname varchar(25) not null,
    CPF char(11) not null,
    Adress varchar(30)
);

create table vehicle(
	VehicleId int auto_increment primary key,
    VClientId int,
    Lplate varchar(8),
    Model varchar(10),
    Color varchar(7),
    constraint fk_client_vehicle foreign key (VClientId) references clients(ClientId)
);

create table team(
	TeamId int auto_increment primary key,
    Tname varchar(20)
);

create table mechanic(
	MechanicId int auto_increment primary key,
    MTeamId int,
    Mname varchar(25),
    Speciality varchar(15),
    Adress varchar(30),
    constraint fk_team_mechanic foreign key (MTeamId) references team(TeamId)
);

create table service_order(
	OrderId int auto_increment primary key,
    OVehicleId int,
    OTeamId int,
    EmissionDate TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    OrderStatus ENUM('Em Análise', 'Em Andamento', 'Concluído'),
    Price FLOAT,
    ConcluisonDate date,
    constraint fk_vehicle_order foreign key (OVehicleId) references vehicle(VehicleId),
    constraint fk_team_order foreign key (OTeamId) references team(TeamId)
);

create table works(
	WorksId int auto_increment primary key,
    Descript varchar(30) not null,
    Price float
);

create table works_in_service(
	WOrderId int,
    WWorksId int,
    constraint fk_order_for_service foreign key (WOrderId) references service_order(OrderId),
    constraint fk_work_on_service foreign key (WWorksId) references works(WorksId)
);

create table parts(
	PartId int auto_increment primary key,
    Pname varchar(10) not null,
    Descript varchar(25),
    Price float not null,
    origen varchar(20)
);

create table parts_in_service(
	PPartId int,
    POrderId int,
    constraint fk_part_service foreign key (PPartId) references parts(PartId),
    constraint fk_order_parts foreign key (POrderId) references service_order(OrderId)
);