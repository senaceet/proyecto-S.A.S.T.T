use SASTT;

select nombre_1 as"primer nombre", nombre_2 as "segundo nombre", apellido_1 as "primer apellido", apellido_2 as "segundo apellido", nombre_tipo_vinculacion as "tipo de vinculacion" from SASTT.usuario u  
inner join  SASTT.instructor i inner join SASTT.vinculacion v on u.num_documento = i.fk_num_documento and i.fk_id_vinculacion  =  v.id_vinculacion;

select nombre_1 as "primer nombre", nombre_2 as "segundo nombre", apellido_1 as "primer apellido", apellido_2 as "segundo apellido", nom_especialidad as "Especialidad" from SASTT.usuario u 
inner join  SASTT.instructor i inner join SASTT.especialidad e on u.num_documento = i.fk_num_documento and i.fk_id_especialidad = e.id_especialidad;

select distinct num_ficha as "ficha", fk_id_grupo as "grupo", nombre_1 as "primer nombre", nombre_2 as "segundo nombre", apellido_1 as "primer apellido", apellido_2 as "segundo apellido" from SASTT.ficha f 
inner join SASTT.grupo g inner join SASTT.aprendiz_ficha a inner join SASTT.usuario u  on f.fk_id_grupo = g.id_grupo and f.num_ficha = a.fk_num_ficha and u.num_documento = a.fk_num_documento;

select nombre_1 as "primer nombre", nombre_2"segundo nombre", apellido_1"primer apellido", apellido_2"segundo apellido", nombre_rol as "rol" from SASTT.usuario u inner join SASTT.rol r 
on u.fk_id_rol = r.id_rol order by apellido_1 desc;

select nombre_tipo_doc as "tipo de documento", num_documento as "numero de identificacion", nombre_1 as "primer nombre", nombre_2 "segundo nombre", apellido_1 "primer apellido", apellido_2 "segundo apellido", 
nombre_rol as "rol" from SASTT.tipo_documento t inner join SASTT.usuario u inner join SASTT.rol r on u.f_id_tipo_documento = t.id_tipo_documento and u.fk_id_rol = r.id_rol order by apellido_1 asc;

select distinct num_ficha as "numero de ficha", descripcion_competencia as "copetencia", Descripcion_resultado as "resultados" from SASTT.ficha f join SASTT.competencias c join SASTT.resultado_de_aprendizaje ra 
join SASTT.programa p on f.fk_id_programa = p.id_programa and p.id_programa = c.fk_id_programa and c.id_competencia = ra.fk_id_competencia;

select distinct num_ficha as "numero de ficha", nombre_grupo as "nombre de grupo", nombre_1 as "primer nombre", nombre_2 as "segundo nombre", apellido_1 as "primer apellido", apellido_2 as "segundo apellido" 
from SASTT.ficha f join SASTT.grupo g inner join SASTT.usuario u inner join SASTT.aprendiz a join SASTT.aprendiz_ficha af on f.fk_id_grupo = g.id_grupo and a.fk_num_documento = af.fk_num_documento and 
af.fk_num_ficha = f.num_ficha where num_ficha like "%1561001%";

select count(*) from SASTT.usuario;

select distinct num_ficha as "numero de ficha", nombre_jornada as "jornada" from SASTT.ficha f inner join SASTT.jornada j on f.fk_id_jornada = j.id_jornada order by num_ficha asc;

select distinct num_ficha as "numero de ficha", nombre_trimestre as "trimestre", nombre_jornada as "jornada" from SASTT.ficha f join SASTT.trimestre t 
join SASTT.jornada j on f.fk_id_trimestre = t.id_trimestre and f.fk_id_jornada = j.id_jornada;

select nombre_tipo_doc as "tipo de documento", nombre_1 as "primer nombre", nombre_2 as "segundo nombre", apellido_1 as "primer apellido", apellido_2 
as "segundo apellido" from SASTT.tipo_documento t join SASTT.usuario u on u.f_id_tipo_documento = t.id_tipo_documento  where id_tipo_documento like '%4%';

select num_ficha as "ficha", nombre_jornada  as "jornada", siglas_jornada as "siglas de jornada" from SASTT.ficha f join SASTT.jornada j 
join SASTT.trimestre t join SASTT.grupo g on f.fk_id_jornada = j.id_jornada and f.fk_id_trimestre = t.id_trimestre 
and f.fk_id_grupo = g.id_grupo where siglas_jornada like "F.S";