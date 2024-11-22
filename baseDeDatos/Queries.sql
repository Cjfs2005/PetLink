
-- Los Queries para el registro de un usuario ya estan considerados en Generate data (insert into)

-- Querie generico que envie los ids de distritos y los nombres de los distritos (Tabla distritos) 

select d.id_distrito, d.nombre_distrito from mydb.distrito d;

-- Queries para verificar el Login de un usuario y que este sea un usuario activo (aprobado por el administrador y no baneado)

select * from mydb.usuario where correo_electronico = "cjfs@pucp.edu.pe" and contrasenia = "password_modified_3" and es_usuario_activo = 1; 

-- Querie para observar el area y distrito de un usuario final (La id de usuario provendrá de un proceso especifico que realice el administrador o coordinador zonal

select u.id_usuario, u.nombres_usuario_final, u.apellidos_usuario_final, d.nombre_distrito, z.nombre_zona from mydb.usuario u
join mydb.distrito d on u.id_distrito = d.id_distrito
join mydb.zona z on u.id_zona = z.id_zona
where u.id_usuario = 3; 

-- Querie para observar los usuarios que pertenecen a una zona en especifico (En este caso zona Oeste)

select u.id_usuario, u.nombres_usuario_final, u.apellidos_usuario_final from mydb.usuario u 
join mydb.zona z on u.id_zona = z.id_zona
where u.id_zona = 4; 

--
--
-- -----------------------------------------------------------  QUERIES PARA USUARIO FINAL -----------------------------------------------------------
--
--

-- Se trabajara por ahora unicamente datos para la zona 3 en el distrito 6 de esta zona (Este, La Molina) y se empleara como usuario de prueba al usuario con id 
-- 3, Manuel Judá Aliaga Aliaga 

-- Muestra todos los albergues que estan en la zona del usuario indicando su respectivo distrito y direccion (Se utilizara para mostrar algunos albergues y cuando el usuario ingresa)

select u.id_usuario, u.nombre_albergue, d.nombre_distrito, u.direccion, u.url_instagram, u.numero_contacto_donaciones, u.numero_yape_plin, 
foto_de_portada_albergue from mydb.usuario u 
join mydb.distrito d on u.id_distrito = d.id_distrito
where u.id_rol = 2 and u.id_zona = 3; 

-- Muestra los albergues que contengan un substring espeficiado por el usuario en su nombre y que pertenezcan a la zona del usuario (Logica para buscar albergues) 

select u.id_usuario, u.nombre_albergue, d.nombre_distrito, u.direccion, u.url_instagram, u.numero_contacto_donaciones, u.numero_yape_plin, 
foto_de_portada_albergue from mydb.usuario u 
join mydb.distrito d on u.id_distrito = d.id_distrito
where u.id_rol = 2 and u.id_zona = 3 and lower(u.nombre_albergue) like lower('%alber%'); 

select u.id_usuario, u.nombre_albergue, d.nombre_distrito, u.direccion, u.url_instagram, u.numero_contacto_donaciones, u.numero_yape_plin, 
foto_de_portada_albergue from mydb.usuario u 
join mydb.distrito d on u.id_distrito = d.id_distrito
where u.id_rol = 2 and u.id_zona = 3 and lower(u.nombre_albergue) like lower('%amigos%'); 

--                                         EVENTOS BENEFICOS 

-- Muestra los eventos beneficos en curso en cualquier zona 

select e.id_publicacion_evento_benefico, e.nombre_evento, e.fecha_hora_inicio_evento, e.fecha_hora_fin_evento, e.entrada_evento, e.descripcion_evento, 
e.artistas_provedores_invitados from mydb.publicacioneventobenefico e where e.es_evento_activo = 1; 

-- Muestra la informacion de un evento benefico en especial (El usuario lo selecciona)

select * from mydb.publicacioneventobenefico e where e.id_publicacion_evento_benefico = 1; 

--                                         MASCOTAS PERDIDAS 

-- Muestra todas las publicaciones activas de mascotas perdidas que aun no hayan sido encontradas (De otros usuarios y propias) 

select perdida.id_usuario, perdida.nombre, perdida.descripcion_mascota, perdida.foto_mascota, perdida.edad_mascota, perdida.raza_mascota, perdida.tamanio_mascota,
perdida.lugar_perdida, perdida.fecha_perdida, perdida.celular_contacto, perdida.recompensa from mydb.publicacionmascotaperdida perdida 
where perdida.fue_encontrada = 0 and perdida.es_publicacion_activa = 1; 

-- Muestra las publicaciones de mascotas perdidas propias (en este caso el id_usuario = 3, tanto las encontradas como las que no asi como las aprobadas, en proceso o rechazadas)

select perdida.nombre, estado.nombre_estado, perdida.descripcion_mascota, perdida.foto_mascota, perdida.edad_mascota, perdida.raza_mascota, perdida.tamanio_mascota,
perdida.lugar_perdida, perdida.fecha_perdida, perdida.celular_contacto, perdida.recompensa from mydb.publicacionmascotaperdida perdida 
join mydb.estado on perdida.id_estado = estado.id_estado
where perdida.id_usuario = 3;

-- Muestra la informacion de una publicacion de mascota perdida en especifico (supongamos, la segunda publicacion)

select perdida.id_usuario, perdida.nombre, perdida.descripcion_mascota, perdida.foto_mascota, perdida.edad_mascota, perdida.raza_mascota, perdida.tamanio_mascota,
perdida.lugar_perdida, perdida.fecha_perdida, perdida.celular_contacto, perdida.recompensa from mydb.publicacionmascotaperdida perdida 
where perdida.id_publicacion_mascota_perdida = 2; 

--                                            DONACIONES 

-- Mostrar solicitudes de Donacion Economica

SELECT
    sde.id_solicitud_donacion_economica AS id_solicitud,
    sde.monto_solicitado as "Objetivo",
    sde.motivo as Motivo,
    sde.fecha_hora_registro,
    usuario.nombre_albergue as "Nombre del albergue"
FROM
    SolicitudDonacionEconomica sde
join mydb.usuario on usuario.id_usuario = sde.id_usuario_albergue
WHERE 
	sde.id_estado = 2 -- 1 (pendiente), 2 (aprobada), 3 (rechazada) 
ORDER BY sde.fecha_hora_registro desc; 

-- Mostrar solicitudes de Donacion de Productos 

SELECT
    sdp.id_solicitud_donacion_productos AS id_solicitud,
    sdp.descripcion_donaciones AS "Motivo/Productos solicitados",
	usuario.nombre_albergue as "Nombre del albergue"
FROM
    SolicitudDonacionProductos sdp
join mydb.usuario on usuario.id_usuario = sdp.id_usuario_albergue
WHERE 
	sdp.id_estado = 2 -- 1 (pendiente), 2 (aprobada), 3 (rechazada) 
ORDER BY sdp.fecha_hora_registro;

--                                    DENUNCIAS DE MALTRATO ANIMAL 

SELECT
    d.id_denuncia_maltrato_animal,
    d.tamanio,
    d.raza,
    d.descripcion_maltrato,
    d.nombre_maltratador,
    d.direccion_maltrato,
    d.fecha_hora_registro,
    s.nombre_estado
FROM
    DenunciaMaltratoAnimal d
join mydb.estado s on d.id_estado = s.id_estado
WHERE
    d.id_usuario_final = 1; -- 1 o 3 son id de usuario disponibles

--                                     POSTULACION A TEMPORALES 

-- Revisa sus postulaciones a hogar temporal 

select id_postulacion_hogar_temporal as ID, estado.nombre_estado as "Estado de postulacion", edad_usuario as Edad, genero_usuario as Genero, celular_usuario as "Celular del usuario", 
cantidad_cuartos as "Cantidad de cuartos", metraje_vivienda as "Metraje del hogar temporal", tiene_mascotas as "Tiene mascotas", 
tiene_hijos as "Tiene hijos", tiene_dependientes as "Tiene dependientes", forma_trabajo as "Forma de trabajo", nombre_persona_referencia as "Persona de referencia", 
celular_persona_referencia as "Celular de la persona de referencia", fecha_inicio_temporal as "Fecha de inicio de hogar temporal", 
fecha_fin_temporal as "Fecha de fin de hogar temporal", cantidad_rechazos_consecutivos as "Rechazos consecutivos en la postulacion" from postulacionhogartemporal temporal 
join mydb.estado on temporal.id_estado = estado.id_estado 
where id_usuario_final = 3;  

-- Revisa las solicitudes de hogar temporal para su ultima postulacion 

select t.nombre_mascota, t.descripcion_mascota, t.fecha_inicio, t.fecha_fin, u2.nombre_albergue from mydb.solicitudhogartemporal t
join mydb.usuario u on t.id_postulacion_hogar_temporal = u.id_ultima_postulacion_hogar_temporal 
join mydb.usuario u2 on t.id_usuario_albergue = u2.id_usuario
where u.id_usuario = 3; 

-- 									VER MASCOTAS PARA ADOPTAR 

select usuario.nombre_albergue as "Nombre de albergue", tipo_raza as Raza, lugar_encontrado, descripcion_mascota, edad_aproximada, 
genero_mascota as Genero, foto_mascota, esta_en_temporal as "Esta en hogar temporla", condiciones_adopcion as "Condiciones de adopcion", id_adoptante
from mydb.publicacionmascotaadopcion join mydb.usuario on usuario.id_usuario = publicacionmascotaadopcion.id_usuario_albergue where id_estado = 2 and id_adoptante IS NULL; 

--
--
--   ----------------------------------------------------------- QUERIES PARA ALBERGUE -----------------------------------------------------------
--
--

-- Se trabajara por ahora unicamente datos para la zona 3 en el distrito 6 de esta zona (Este, La Molina) y se empleara como albergue de prueba al usuario con id 
-- 6, 'Albergue Esperanza'

--                                     VISUALIZAR SU PERFIL 

select u.nombre_albergue as "Nombre de albergue", concat(u.nombres_encargado, ' ', u.apellidos_encargado) as "Encargado", 
u.anio_creacion as "Año de creacion", u.cantidad_animales, u.espacio_disponible, u.url_instagram, u.correo_electronico, u.foto_de_portada_albergue, u.nombre_foto_de_portada,
u.logo_albergue, u.nombre_logo_albergue, u.direccion_donaciones, u.nombre_contacto_donaciones as "Nombre de conctacto para donaciones", u.numero_contacto_donaciones as 
"Numero de contacto para donaciones", u.numero_yape_plin, u.imagen_qr, u.nombre_imagen_qr, u.descripcion_perfil from mydb.usuario u where u.id_usuario = 6; 


--                                     VISUALIZAR HOGARES TEMPORALES DISPONIBLES 

-- Filtrar por zona, validar que el estado sea aprobado

select pht.id_postulacion_hogar_temporal as "ID de postulacion", u.id_usuario as "ID de usuario", concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de postulante", 
pht.celular_usuario, d.nombre_distrito as "Distrito", pht.fecha_inicio_temporal as "Fecha de inicio", pht.fecha_fin_temporal as "Fecha de fin" from mydb.postulacionhogartemporal pht
join mydb.usuario u on pht.id_usuario_final = u.id_usuario
join mydb.distrito d on  d.id_distrito = u.id_distrito; 


--                                     VISUALIZAR UNA POSTULACION HOGAR TEMPORAL EN ESPECIFICO

-- Datos de la postulacion

select concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de postulante", pht.edad_usuario as "Edad", pht.genero_usuario as "Genero",
pht.celular_usuario as "Celular", pht.cantidad_cuartos as "Cantidad de cuartos", pht.metraje_vivienda as "Metraje de la vivienda", pht.tiene_mascotas as "Tiene mascotas", 
pht.tipo_mascotas as "Tipo mascotas", pht.tiene_hijos as "Tiene hijos", pht.tiene_dependientes as "Tiene dependientes", 
pht.forma_trabajo as "Forma de trabajo", pht.nombre_persona_referencia as "Personas de referencia", 
pht.celular_persona_referencia as "Celular de la persona de referencia", pht.fecha_inicio_temporal as "Fecha de inicio de hogar temporal", 
pht.fecha_fin_temporal as "Fecha de fin de hogar temporal" from mydb.postulacionhogartemporal pht 
join mydb.usuario u on u.id_usuario = pht.id_usuario_final
where pht.id_postulacion_hogar_temporal = 1; 

-- ids de las Fotos asociadas a la postulacion 

select fpht.id_foto_postulacion_hogar_temporal as "ID foto postulacion" , fpht.nombre_foto_lugar_temporal as "Nombre de foto"
from mydb.fotopostulacionhogartemporal fpht where fpht.id_postulacion_hogar_temporal = 1; 

-- extrae el blob de una imagen en especifico 

select fpht.foto_lugar_temporal, fpht.id_postulacion_hogar_temporal from mydb.fotopostulacionhogartemporal fpht where fpht.id_foto_postulacion_hogar_temporal = 1; 


--                                     VER PUBLICACIONES DE ADOPCION REALIZADAS 

select pma.nombre_mascota, pma.tipo_raza, pma.lugar_encontrado, pma.descripcion_mascota, 
pma.edad_aproximada, pma.genero_mascota, pma.foto_mascota, pma.nombre_foto_mascota,
pma.esta_en_temporal, pma.condiciones_adopcion, pma.id_adoptante from mydb.PublicacionMascotaAdopcion pma where id_usuario_albergue = 6; 

--                                     VER POSTULACIONES DE ADOPCION A UNA PUBLICACION EN ESPECIAL


select concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de postulante", pma.id_usuario_final,
pma.fecha_hora_registro, u.correo_electronico as "Correo Electronico" from mydb.postulacionmascotaadopcion pma 
join mydb.usuario u on u.id_usuario = pma.id_usuario_final
where pma.id_publicacion_mascota_adopcion = 1; 

--                                     VER PUBLICACIONES DE DONACIONES REALIZADAS 

-- Economicas

SELECT
    sde.id_solicitud_donacion_economica AS id_solicitud,
    sde.monto_solicitado as "Objetivo",
    sde.motivo as Motivo,
    sde.fecha_hora_registro
FROM
    SolicitudDonacionEconomica sde
WHERE 
	sde.id_usuario_albergue = 6
ORDER BY sde.fecha_hora_registro desc; 


--                                     VER REGISTROS DE DONACIONES REALIZADAS A UNA PUBLICACION EN ESPECIAL 

select 
	concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de donador",
    u.id_usuario as "ID del usuario donador", 
    rde.monto_donacion as "Monto donado", 
    rde.fecha_hora_registro as "Fecha y hora de la donacion"
from 
	mydb.RegistroDonacionEconomica rde 
join
	mydb.usuario u on u.id_usuario = rde.id_usuario_final
where 
	rde.id_solicitud_donacion_economica = 1
ORDER BY 
	rde.fecha_hora_registro desc; 

-- Productos

SELECT
    sdp.id_solicitud_donacion_productos AS id_solicitud,
    sdp.descripcion_donaciones AS "Motivo/Productos solicitados"
FROM
    SolicitudDonacionProductos sdp
WHERE 
	sdp.id_usuario_albergue = 6
ORDER BY sdp.fecha_hora_registro;


--                                     VER REGISTROS DE DONACIONES REALIZADAS A UNA PUBLICACION EN ESPECIAL 

select 
	concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de donador",
    u.id_usuario as "ID del usuario donador", 
    rdp.descripciones_donaciones as "Donaciones realizadas", 
    rdp.fecha_hora_registro as "Fecha y hora de la donacion"
from 
	mydb.RegistroDonacionProductos rdp 
join
	mydb.usuario u on u.id_usuario = rdp.id_usuario_final
join 
	mydb.horariorecepciondonacion hrd on rdp.id_horario_recepcion_donacion = hrd.id_horario_recepcion_donacion
join 
	mydb.puntoacopiodonacion pad on pad.id_punto_acopio_donacion = hrd.id_punto_acopio_donacion
where  pad.id_solicitud_donacion_productos = 1
ORDER BY 
	rdp.fecha_hora_registro desc; 


 --                                     VER PUBLICACIONES DE EVENTOS BENEFICOS
 
select e.id_publicacion_evento_benefico, s.nombre_estado, e.nombre_evento, e.fecha_hora_inicio_evento, e.fecha_hora_fin_evento, e.entrada_evento, e.descripcion_evento, 
e.artistas_provedores_invitados from mydb.publicacioneventobenefico e 
join mydb.estado s on s.id_estado = e.id_estado
where e.id_usuario_albergue = 7; 
 
 --                                     VER INSCRIPCIONES DE UN EVENTO BENEFICO EN ESPECIFICO 
 
 select concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de participante", ieb.id_usuario_final , ieb.fecha_hora_registro 
 from inscripcionEventoBenefico ieb 
 join usuario u on u.id_usuario = ieb.id_usuario_final 
 where ieb.id_inscripcion_evento_benefico = 1; 
  
  --   ----------------------------------------------------------- QUERIES PARA COORDINADOR ZONAL -----------------------------------------------------------

-- Tony 

--                                     POSTULACIONES A HOGAR TEMPORAL 

-- LISTAR TODAS LAS POSTULACIONES A HOGAR TEMPORAL EN LA ZONA RESPECTIVA 

update mydb.postulacionhogartemporal pht set pht.id_estado = 1 where pht.id_postulacion_hogar_temporal = 1; -- Simula que la solicitud esta pendiente

select concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de postulante", pht.celular_usuario as "Celular", pht.llamo_al_postulante as "¿Se llamo al postulante?", 
d.nombre_distrito as "Distrito", pht.fecha_visita
from PostulacionHogarTemporal pht
join usuario u on u.id_usuario = pht.id_usuario_final
join distrito d on u.id_distrito = d.id_distrito
where u.id_zona = 3 and pht.id_estado = 1; 

-- ACTUALIZAR DATOS CUANDO SE HAYA COMUNICADO Y REALIZADO UNA VISITA 

select * from mydb.postulacionhogartemporal pht where pht.id_usuario_final = 3; -- Temporalmente se esta usando * para revisar el estado previo

update mydb.postulacionhogartemporal pht set pht.llamo_al_postulante = 1, pht.fecha_visita = "2024-10-03" where pht.id_postulacion_hogar_temporal = 1; 

select * from mydb.postulacionhogartemporal pht where pht.id_usuario_final = 3; -- Temporalmente se esta usando * para revisar el estado posterior

-- LISTAR TODA LA INFORMACION RELATIVA A UNA POSTULACION DE HOGAR TEMPORAL EN ESPECIFICO  

select concat(u.nombres_usuario_final, ' ', u.apellidos_usuario_final) as "Nombre de postulante", pht.edad_usuario as "Edad", pht.genero_usuario as "Genero",
pht.celular_usuario as "Celular", pht.cantidad_cuartos as "Cantidad de cuartos", pht.metraje_vivienda as "Metraje de la vivienda", pht.tiene_mascotas as "Tiene mascotas", 
pht.tipo_mascotas as "Tipo mascotas", pht.tiene_hijos as "Tiene hijos", pht.tiene_dependientes as "Tiene dependientes", 
pht.forma_trabajo as "Forma de trabajo", pht.nombre_persona_referencia as "Personas de referencia", 
pht.celular_persona_referencia as "Celular de la persona de referencia", pht.fecha_inicio_temporal as "Fecha de inicio de hogar temporal", 
pht.fecha_fin_temporal as "Fecha de fin de hogar temporal" from mydb.postulacionhogartemporal pht 
join mydb.usuario u on u.id_usuario = pht.id_usuario_final
where pht.id_postulacion_hogar_temporal = 1; 

-- ACTUALIZAR TABLA DE ESTADOS DE UNA POSTULACION DE HOGAR TEMPORAL 

update mydb.postulacionhogartemporal pht set pht.id_estado = 1 where pht.id_postulacion_hogar_temporal = 1; -- Simula que la solicitud esta pendiente

select e.nombre_estado from PostulacionHogarTemporal pht join Estado e on e.id_estado = pht.id_estado where pht.id_postulacion_hogar_temporal = 1; 

update mydb.postulacionhogartemporal pht set pht.id_estado = 2 where pht.id_postulacion_hogar_temporal = 1; -- Pasa de estar pendiente a aprobada

select e.nombre_estado from PostulacionHogarTemporal pht join Estado e on e.id_estado = pht.id_estado where pht.id_postulacion_hogar_temporal = 1; 

update mydb.postulacionhogartemporal pht set pht.id_estado = 3 where pht.id_postulacion_hogar_temporal = 1; -- Pasa de estar pendiente a rechazada

select e.nombre_estado from PostulacionHogarTemporal pht join Estado e on e.id_estado = pht.id_estado where pht.id_postulacion_hogar_temporal = 1; 

-- Manuel Juda Aliaga Aliaga

-- =====================================
-- 1. Listar publicaciones de mascotas perdidas hechas por terceros en una zona específica
-- =====================================
SELECT 
    p.id_publicacion_mascota_perdida AS 'ID', 
    p.lugar_perdida AS 'Última ubicación conocida', 
    p.fecha_perdida AS 'Fecha y hora de último avistamiento', 
    CONCAT(p.raza_mascota, ', de tamaño ', p.tamanio_mascota, ', ', p.edad_mascota, ' años') AS 'Descripción', 
    CONCAT(p.nombre_contacto, ', ', p.celular_contacto) AS 'Información de contacto' 
FROM 
    PublicacionMascotaPerdida p
JOIN 
    Usuario u ON u.id_usuario = p.id_usuario 
JOIN 
	Zona z on u.id_zona = z.id_zona
WHERE 
    p.id_tipo_publicacion_mascota_perdida = 2  -- Asumiendo que '2' representa terceros
    AND z.id_zona = 3                          -- Reemplaza [ID_ZONA] con el ID de la zona específica
    AND p.id_estado = 1;                       -- Asumiendo que '1' representa "en espera"

-- =====================================
-- 2. Listar publicaciones de mascotas perdidas hechas por el dueño en una zona específica
-- =====================================
-- Opción 1: Actualizar la hora de último avistamiento
UPDATE mydb.PublicacionMascotaPerdida 
SET fecha_perdida = '2024-11-05 14:30:00'  -- Nuevo valor para la fecha y hora de último avistamiento
WHERE id_publicacion_mascota_perdida = 1;  -- ID de la publicación específica que se desea modificar

-- Opción 2: Actualizar la descripción de la publicación
UPDATE mydb.PublicacionMascotaPerdida 
SET descripcion_mascota = 'Nuevo avistamiento con descripción actualizada de la mascota'  -- Nuevo valor para la descripción
WHERE id_publicacion_mascota_perdida = 1;  -- ID de la publicación específica que se desea modificar

-- =====================================
-- 3. Listar todas las publicaciones de mascotas perdidas en curso en una zona específica
-- =====================================
UPDATE mydb.PublicacionMascotaPerdida
SET fue_encontrada = 1,            -- Marca que la mascota ha sido encontrada
    es_publicacion_activa = 0       -- Cambia el estado de la publicación a inactiva
WHERE id_publicacion_mascota_perdida = 1;  -- ID de la publicación específica
-- =====================================
-- 4. Actualizar un valor de una publicación de mascota perdida (Ej: Hora de avistamiento o descripción)
-- =====================================
SELECT 
    p.id_publicacion_mascota_perdida AS 'ID',
    p.lugar_perdida AS 'Última ubicación conocida',
    p.fecha_perdida AS 'Fecha de último avistamiento',
    CONCAT(p.raza_mascota, ', de tamaño ', p.tamanio_mascota, ', ', p.edad_mascota, ' años') AS 'Descripción',
    CONCAT(p.nombre_contacto, ', ', p.celular_contacto) AS 'Información de contacto'
FROM 
    mydb.PublicacionMascotaPerdida p
JOIN 
    mydb.Usuario u ON u.id_usuario = p.id_usuario
JOIN 
    mydb.Zona z ON u.id_zona = z.id_zona
WHERE 
    p.id_tipo_publicacion_mascota_perdida = 2     -- Publicación realizada por un tercero
    AND z.id_zona = 3                             -- Zona específica (reemplazar con el ID de la zona deseada)
    AND p.id_estado = 1;                          -- Estado en espera


-- =====================================
-- 5. Confirmar que la mascota ha sido encontrada y desactivar la publicación
-- =====================================
SELECT 
    p.id_publicacion_mascota_perdida AS 'ID',
    p.nombre AS 'Nombre de la mascota',
    p.raza_mascota AS 'Raza',
    p.tamanio_mascota AS 'Tamaño',
    p.edad_mascota AS 'Edad',
    p.lugar_perdida AS 'Lugar de pérdida',
    p.fecha_perdida AS 'Fecha de pérdida',
    CONCAT(p.nombre_contacto, ', ', p.celular_contacto) AS 'Información de contacto'
FROM 
    mydb.PublicacionMascotaPerdida p
JOIN 
    mydb.Usuario u ON u.id_usuario = p.id_usuario
JOIN 
    mydb.Zona z ON u.id_zona = z.id_zona
WHERE 
    p.id_tipo_publicacion_mascota_perdida = 1     -- Publicación realizada por el dueño
    AND z.id_zona = 3                             -- Zona específica (reemplazar con el ID de la zona deseada)
    AND p.id_estado = 1;                          -- Estado en espera


-- =====================================
-- 6. Cambiar el estado de una solicitud de publicación de “En proceso” a “Activa” o “Rechazada”
-- =====================================
UPDATE mydb.PublicacionMascotaPerdida
SET id_estado = 2           -- Cambiar a 2 para "Activa" o a 3 para "Rechazada"
WHERE id_publicacion_mascota_perdida = 1  -- ID de la solicitud específica a actualizar
AND id_estado = 1;       -- Solo actualizar si la solicitud está en "En proceso"

-- ---------------------------- QUERIES ADMINISTRADOR ----------------------------

-- Alejandro Emanuel Gutarra Bendezu 

#Usuarios (Usuarios finales + Albergues) activos
SELECT id_usuario
FROM usuario
where usuario.es_usuario_activo=1;

#querys para usuario activos
SELECT COUNT(*) AS cantidad_usuarios_activos
FROM usuario
WHERE (id_rol = 1 OR id_rol = 2) AND es_usuario_activo = 1;

#querys para usuario baneado
SELECT COUNT(*) AS cantidad_usuarios_baneados
FROM usuario
WHERE id_rol=1 AND es_usuario_activo = 0;

#querys para cantidad de albergues
SELECT COUNT(*) AS cantidad_albergues
FROM usuario
WHERE es_usuario_activo = 1 AND id_rol = 2; 

#ahora vamos hacer querys para la cantidad de mascotas perdidas en lo últimos 3 meses
SELECT MONTH(fecha_perdida) AS mes, COUNT(*) AS mascotas_perdidas_ultimos_3_meses
FROM PublicacionMascotaPerdida
WHERE es_publicacion_activa = 1
AND fecha_perdida >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY MONTH(fecha_perdida)
ORDER BY mes desc;

#ahora vamos hacer querys para la cantidad de mascotas perdidas en el ultimo año
SELECT MONTH(fecha_perdida) AS mes, COUNT(*) AS mascotas_perdidas_totales
FROM PublicacionMascotaPerdida
WHERE YEAR(fecha_perdida) = YEAR(CURDATE())
GROUP BY MONTH(fecha_perdida);

#ahora vamos hacer querys para la cantidad encontrada en los últimos 3 meses
SELECT MONTH(fecha_perdida) AS mes, COUNT(*) AS mascotas_encontradas_ultimos_3_meses
FROM PublicacionMascotaPerdida
WHERE es_publicacion_activa = 1
  AND fue_encontrada = 1
  AND fecha_perdida >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY MONTH(fecha_perdida);

#ahora vamos hacer querys para la cantidad de mascotas encontradas en 1 año
SELECT MONTH(fecha_perdida) AS mes, COUNT(*) AS mascotas_encontradas_totales
FROM PublicacionMascotaPerdida
WHERE YEAR(fecha_perdida) = YEAR(CURDATE())
  AND fue_encontrada = 1
GROUP BY MONTH(fecha_perdida);

#top 10 albergue

select sum(rde.monto_donacion) as "Total", id_usuario_albergue as "ID de albergue" from registrodonacioneconomica rde 
join solicituddonacioneconomica sde on sde.id_solicitud_donacion_economica = rde.id_solicitud_donacion_economica
group by (sde.id_usuario_albergue)
order by Total desc
limit 10;

-- 10 albergues que más plata han pedido 

SELECT 
    u.nombre_albergue,
    SUM(sd.monto_solicitado) AS total_solicitado
FROM 
    mydb.solicituddonacioneconomica AS sd
JOIN 
    mydb.usuario AS u ON sd.id_usuario_albergue = u.id_usuario
WHERE 
    u.id_rol = 2 -- Asumiendo que id_rol = 2 corresponde a los albergues
GROUP BY 
    u.nombre_albergue
ORDER BY 
    total_solicitado DESC
LIMIT 10;

#ahora serian querya para el top 10 de usuario con mayores donaciones por dinero
SELECT 
    u.nombres_usuario_final AS usuario,
    SUM(rde.monto_donacion) AS total_donaciones
FROM 
    usuario u
JOIN 
    RegistroDonacionEconomica rde ON u.id_usuario = rde.id_usuario_final
GROUP BY 
    u.nombres_usuario_final
ORDER BY 
    total_donaciones DESC
LIMIT 10;

#Query de prueba 

select * from mydb.usuario where usuario.id_usuario= 1; 

select * from PublicacionMascotaAdopcion; 

SELECT p.id_publicacion_mascota_adopcion, p.tipo_raza, p.lugar_encontrado, p.descripcion_mascota, 
p.edad_aproximada, p.genero_mascota, p.foto_mascota, p.esta_en_temporal, p.condiciones_adopcion, 
p.nombre_mascota FROM PublicacionMascotaAdopcion p 
WHERE p.id_publicacion_mascota_adopcion = 1;

SELECT po.id_publicacion_mascota_adopcion, po.fecha_hora_registro, po.id_estado, pu.nombre_mascota, pu.foto_mascota from postulacionmascotaadopcion po
JOIN mydb.publicacionmascotaadopcion pu
WHERE po.id_usuario_final = 1 and po.id_publicacion_mascota_adopcion = pu.id_publicacion_mascota_adopcion; 

SELECT u.id_usuario, u.nombres_usuario_final, u.apellidos_usuario_final, u.foto_perfil FROM Usuario u WHERE u.id_usuario = 1; 

SELECT pma.id_publicacion_mascota_adopcion, pma.nombre_mascota, pma.foto_mascota FROM PublicacionMascotaAdopcion pma
WHERE pma.id_usuario_albergue = 6;

SELECT * from usuario where usuario.id_usuario = 1; 