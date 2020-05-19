drop database SASTT;
create database SASTT;
use SASTT;

create table SASTT.tipo_documento( 
id_documento varchar(15) not null,
siglas varchar(5) not null,
nombre_tipo_doc varchar(30) not null,
primary key(id_documento)
);
create table SASTT.estado(
id_estado int (10) not null,
roles varchar(8) not null,
id_usuario int(10) not null,
primary key (id_estado)
);
create table SASTT.genero(
id_genero int(10) not null,
nombre_genero varchar (10) not null,
primary key(id_genero)
);
create table SASTT.rol(
id_rol int(10) not null,
nombre_rol varchar(25) not null,
primary key(id_rol)
);
create table SASTT.rh(
id_rh int (10) not null,
nombre_rh varchar (5) not null,
primary key (id_rh)
);

create table SASTT.usuarios(
id_usuario varchar (15) not null,
nombre_1 varchar (25) not null,
nombre_2 varchar (25),
apellido_1 varchar (25) not null,
apellido_2 varchar (25),
fecha_nacimiento date not null,
direccion varchar (50) not null,
tel_movil int (10) not null,
tel_fijo int (7),
indicativo_ciudad tinyint (3),
correo varchar (40) not null,
fk_id_documento varchar(15) not null,
fk_id_genero int (10) not null,
fk_id_rh int (10) not null,
fk_id_rol int (10) not null,
fk_id_estado int (10) not null,
constraint fk_id_documento_u foreign key (fk_id_documento) references SASTT.tipo_documento (id_documento) on update cascade,
constraint fk_id_genero_u foreign key (fk_id_genero) references SASTT.genero (id_genero) on update cascade,
constraint fk_id_rh_u foreign key (fk_id_rh) references SASTT.rh (id_rh) on update cascade,
constraint fk_id_rol_u foreign key (fk_id_rol) references SASTT.rol (id_rol) on update cascade,
constraint fk_id_estado_u foreign key (fk_id_estado) references SASTT.estado (id_estado) on update cascade,
primary key (id_usuario, fk_id_documento)
);
create table SASTT.fichas(
id_ficha int(10) not null,
ambiente varchar(10) not null,
grupo int(2) not null,
fk_id_usuario varchar (15) not null,
constraint fk_id_usuario_f foreign key (fk_id_usuario) references SASTT.usuarios (id_usuario) on update cascade,
primary key (id_ficha)
);
create table SASTT.programas(
id_programa varchar(40) not null,
nombre_programa varchar(100) not null,
descripcion_programa varchar(300) not null,
area varchar(15) not null,
requisitos varchar (100),
fk_id_ficha int(10) not null,
constraint fk_id_ficha_p foreign key (fk_id_ficha) references SASTT.fichas (id_ficha) on update cascade,
primary key(id_programa)
);
create table SASTT.competencias(
id_competencias int (10) not null,
temas varchar(50) not null,
materia  varchar(20) not null,
descripcion varchar(255) not null,
habilidades varchar(255)not null,
calificacion float(4) not null,
fk_id_programa varchar(40) not null,
constraint fk_id_programa_c foreign key (fk_id_programa) references SASTT.programas (id_programa) on update cascade,
primary key(id_competencias)
);
create table SASTT.resultados(
id_resultados int (10) not null,
nombre_resultado varchar (15) not null,
concepto varchar (100),
fk_id_competencias int (10) not null,
constraint fk_id_competencias_c foreign key (fk_id_competencias) references SASTT.competencias (id_competencias)  on update cascade,
primary key(id_resultados)
);
create table SASTT.periodo(
id_periodo int (10) not null,
inicio date not null,
final date not null,
estado varchar (15) not null,
fk_id_ficha int(10) not null,
constraint fk_id_ficha_pe foreign key (fk_id_ficha) references SASTT.fichas (id_ficha) on update cascade,
primary key (id_periodo, fk_id_ficha)
);
create table SASTT.jornada(
id_jornada int (10) not null,
nombre_jornada varchar (20) not null,
fk_id_fichas int(7) not null,
constraint fk_id_fichas_j foreign key (fk_id_fichas) references SASTT.fichas (id_ficha) on update cascade,
primary key (id_jornada)
);

create table SASTT.serv_correo(
id_correo int (4) not null,
nombre_serv_correo varchar (40)
);
create table SASTT.log_error(
id_error int(10) not null,
descripcion_error varchar(200),
fecha_error datetime
);
