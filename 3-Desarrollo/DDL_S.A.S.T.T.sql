drop database SASTT;
create database SASTT;
use SASTT;

create table SASTT.tipo_documento( 
id_tipo_documento varchar (15) not null,
siglas varchar(5) not null,
nombre_tipo_doc varchar(30) not null,
primary key(id_tipo_documento)
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
create table SASTT.vinculacion(
id_vinculacion varchar(11) not null,
nombre_tipo_vinculacion varchar (20)not null,
horas_laborales varchar(20) not null,
primary key(id_vinculacion)
);
create table SASTT.especialidad(
id_especialidad int(10) not null,
nom_especialidad varchar(20) not null,
primary key(id_especialidad)
);
create table SASTT.grupo(
id_grupo int (10) not null,
nombre_grupo varchar (10) not null,
primary key(id_grupo)
);
create table SASTT.trimestre(
id_trimestre int(10) not null,
nombre_trimestre varchar (15) not null,
primary key (id_trimestre)
);
create table SASTT.jornada(
id_jornada int (10) not null,
nombre_jornada varchar (20) not null,
siglas_jornada varchar (5) not null,
primary key (id_jornada)
);

create table SASTT.usuario(
num_documento varchar (15) not null,
nombre_1 varchar (25) not null,
nombre_2 varchar (25),
apellido_1 varchar (25) not null,
apellido_2 varchar (25),
fecha_nacimiento date not null,
direccion varchar (100) not null,
tel_movil bigint (15) not null,
tel_fijo int (11) not null,
foto blob,
correo varchar (100) not null,
contraseña varchar (40) not null,
fk_id_rh int (10) not null,
f_id_tipo_documento  varchar (15) not null,
fk_id_rol int (10) not null,
constraint fk_id_rh foreign key (fk_id_rh) references SASTT.rh (id_rh) on update cascade,
constraint f_id_tipo_documento_123 foreign key (f_id_tipo_documento) references SASTT.tipo_documento (id_tipo_documento) on update cascade,
constraint fk_id_rol_u foreign key (fk_id_rol) references SASTT.rol (id_rol) on update cascade,
primary key (num_documento, f_id_tipo_documento)
);
create table SASTT.instructor(
f_id_tipo_documento  varchar (15) not null,
fk_num_documento varchar (15) not null,
fk_id_vinculacion varchar(11) not null,
fk_id_especialidad int(10) not null,
constraint f_id_tipo_documento_456 foreign key (f_id_tipo_documento) references SASTT.usuario (f_id_tipo_documento) on update cascade,
constraint fk_num_documento_i foreign key (fk_num_documento) references SASTT.usuario (num_documento) on update cascade,
constraint fk_id_vinculacion_i foreign key (fk_id_vinculacion) references SASTT.vinculacion (id_vinculacion) on update cascade,
constraint fk_id_especialidad_i foreign key (fk_id_especialidad) references SASTT.especialidad (id_especialidad) on update cascade,
primary key (fk_num_documento, f_id_tipo_documento)
);
create table SASTT.aprendiz(
f_id_tipo_documento varchar (15) not null,
fk_num_documento varchar (15) not null,
constraint f_id_tipo_documento_789 foreign key (f_id_tipo_documento) references SASTT.usuario (f_id_tipo_documento) on update cascade,
constraint fk_num_documento_ap foreign key (fk_num_documento) references SASTT.usuario (num_documento) on update cascade,
primary key (f_id_tipo_documento, fk_num_documento)
);
create table SASTT.administrador(
f_id_tipo_documento varchar (15) not null,
fk_num_documento varchar (15) not null,
constraint fk_num_documento_ad foreign key (fk_num_documento) references SASTT.usuario (num_documento) on update cascade,
constraint f_id_tipo_documento_ad foreign key (f_id_tipo_documento) references SASTT.usuario (f_id_tipo_documento) on update cascade,
primary key (f_id_tipo_documento, fk_num_documento)
);
create table SASTT.programa(
id_programa int (6) not null,
nombre_programa varchar(150) not null,
siglas varchar (8) not null,
descripcion_programa text not null,
fk_id_especialidad int(10) not null,
constraint fk_id_especialidad foreign key (fk_id_especialidad) references SASTT.especialidad (id_especialidad) on update cascade,
primary key(id_programa, fk_id_especialidad)
);
create table SASTT.competencias(
id_competencia int (10) not null,
descripcion_competencia text not null,
fk_id_programa int (6) not null,
constraint fk_id_programa foreign key (fk_id_programa) references SASTT.programa (id_programa) on update cascade,
primary key(id_competencia, fk_id_programa)
);
create table SASTT.resultado_de_aprendizaje(
id_resultado int (10) not null,
Descripcion_resultado text,
fk_id_competencia int (10) not null,
constraint fk_id_competencia foreign key (fk_id_competencia) references SASTT.competencias (id_competencia) on update cascade,
primary key(id_resultado, fk_id_competencia)
);
create table SASTT.ficha(
num_ficha varchar(10) not null,
fk_id_jornada int (10) not null,
fk_id_programa int (6) not null,
fk_id_grupo int (10) not null,
fk_id_trimestre int(10) not null,
fk_num_documento varchar (15) not null,
constraint fk_id_jornada_f foreign key (fk_id_jornada) references SASTT.jornada (id_jornada) on update cascade,
constraint fk_id_programa_f foreign key (fk_id_programa) references SASTT.programa (id_programa) on update cascade,
constraint fk_id_grupo_f foreign key (fk_id_grupo) references SASTT.grupo (id_grupo) on update cascade,
constraint fk_id_trimestre_f foreign key (fk_id_trimestre) references SASTT.trimestre (id_trimestre) on update cascade,
constraint fk_num_documento_f foreign key (fk_num_documento) references SASTT.instructor (fk_num_documento) on update cascade,
primary key (num_ficha, fk_id_grupo, fk_id_trimestre)
);
create table SASTT.aprendiz_ficha(
fk_num_ficha varchar(10) not null,
f_id_tipo_documento varchar (15) not null,
fk_num_documento varchar (15) not null,
constraint f_id_tipo_documento_af foreign key (f_id_tipo_documento) references SASTT.aprendiz (f_id_tipo_documento) on update cascade,
constraint fk_num_documento_af foreign key (fk_num_documento) references SASTT.aprendiz (fk_num_documento) on update cascade,
constraint fk_num_ficha foreign key (fk_num_ficha) references SASTT.ficha (num_ficha) on update cascade,
primary key (fk_num_documento, fk_num_ficha)
);

create table SASTT.log_error(
id_error int(11) not null,
descripcion_error varchar(200) not null,
fecha_error datetime not null
);
