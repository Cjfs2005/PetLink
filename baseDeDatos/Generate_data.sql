-- Queries - Cargar Datos Simulados 

-- Insertar registros de zonas

insert into mydb.Zona(nombre_zona) values ("Norte");
insert into mydb.Zona(nombre_zona) values ("Sur");
insert into mydb.Zona(nombre_zona) values ("Este");
insert into mydb.Zona(nombre_zona) values ("Oeste");

-- Insertar registros de distritos 

-- Zona Norte

insert into mydb.Distrito(nombre_distrito, id_zona) values ("Ancon", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Santa Rosa", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Carabayllo", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Puente Piedra", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Comas", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Los Olivos", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Martin de Porres", 1); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Independencia", 1); 

-- Zona Sur

insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Juan de Miraflores", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Villa María del Triunfo", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Villa el Salvador", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Pachacamac", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Lurin", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Punta Hermosa", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Punta Negra", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Bartolo", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Santa María del Mar", 2); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Pucusana", 2); 

-- Zona Este 

insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Juan de Lurigancho", 3); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Lurigancho/Chosica", 3); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Ate", 3); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("El Agustino", 3); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Santa Anita", 3); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("La Molina", 3); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Cieneguilla", 3); 

-- Zona Oeste

insert into mydb.Distrito(nombre_distrito, id_zona) values ("Rimac", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Cercado de Lima", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Breña", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Pueblo Libre", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Magdalena", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Jesus María", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("La Victoria", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Lince", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Isidro", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Miguel", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Surquillo", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Borja", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Santiago de Surco", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Barranco", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Chorrillos", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("San Luis", 4); 
insert into mydb.Distrito(nombre_distrito, id_zona) values ("Miraflores", 4); 

-- Insertar roles 

insert into mydb.Rol(nombre_rol) values ("Usuario Final");  
insert into mydb.Rol(nombre_rol) values ("Albergue");
insert into mydb.Rol(nombre_rol) values ("Coordinador de Zona");
insert into mydb.Rol(nombre_rol) values ("Administrador");

-- Insertar estados 

insert into mydb.Estado(id_estado, nombre_estado) values (1,"Pendiente");  
insert into mydb.Estado(id_estado, nombre_estado) values (2,"Aprobada"); 
insert into mydb.Estado(id_estado, nombre_estado) values (3,"Rechazada");

-- Insertar registros de los tipos de publicaciones de mascotas perdidad

insert into mydb.TipoPublicacionMascotaPerdida(tipo_publicacion) values ("Publicación del dueño"),("Publicación de tercero");

-- Insertar 5 registros de Usuarios Finales 

-- Usuario con contraseña temporal al registrarse por primera vez 
insert into mydb.Usuario(dni,nombres_usuario_final, apellidos_usuario_final, direccion, id_rol, correo_electronico, id_distrito, id_zona, id_ultima_postulacion_hogar_temporal, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, nombre_foto_perfil, foto_perfil, contrasenia_hashed) 
values ("72207089", "Tony Lee", "Flores Aguirre", "Av. Brasil 1791", 1, "tfa@pucp.edu.pe", 6, 4, NULL, "tony1212", 0, date_add(now(),interval 30 minute), 0, 1, now(),"foto_perfil.png", LOAD_FILE("C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\foto_perfil.png"), sha2("tony1212", 256));  

insert into mydb.Usuario(dni,nombres_usuario_final, apellidos_usuario_final, direccion, id_rol, correo_electronico, id_distrito, id_zona, id_ultima_postulacion_hogar_temporal, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, nombre_foto_perfil, foto_perfil, contrasenia_hashed) 
values ("71200484", "Manuel Judá", "Aliaga Aliaga", "Av. Ricardo Elías Aparicio 715", 1, "maliagaa@pucp.edu.pe", 6, 3, NULL, "manuel3434", 0, date_add(now(),interval 30 minute), 0, 1, now(),"foto_perfil.png", LOAD_FILE("C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\foto_perfil.png"), sha2("manuel3434", 256));  

insert into mydb.Usuario(dni,nombres_usuario_final, apellidos_usuario_final, direccion, id_rol, correo_electronico, id_distrito, id_zona, id_ultima_postulacion_hogar_temporal, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, nombre_foto_perfil, foto_perfil, contrasenia_hashed) 
values ("77812045", "Christian Jair", "Flores Soto", "Jirón Huascar 436", 1, "cjfs@pucp.edu.pe", 5, 2, NULL, "christian5656", 0, date_add(now(),interval 30 minute), 0, 1, now(),"foto_perfil.png", LOAD_FILE("C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\foto_perfil.png"), sha2("christian5656", 256));   

insert into mydb.Usuario(dni,nombres_usuario_final, apellidos_usuario_final, direccion, id_rol, correo_electronico, id_distrito, id_zona, id_ultima_postulacion_hogar_temporal, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, nombre_foto_perfil, foto_perfil, contrasenia_hashed) 
values ("71104377", "Alejandro Emanuel", "Gutarra Bendezu", "Av. Carlos Izaguirre 295", 1, "gutarra2805@pucp.edu.pe", 8, 1, NULL, "alejandro7878", 0, date_add(now(),interval 30 minute), 0, 1, now(),"foto_perfil.png", LOAD_FILE("C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\foto_perfil.png"), sha2("alejandro7878", 256)); 

-- Insertar 3 registros de Albergue 

insert into mydb.Usuario(nombre_albergue, nombres_encargado, apellidos_encargado, direccion, id_rol, correo_electronico, id_distrito, id_zona, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, anio_creacion, cantidad_animales, url_instagram, direccion_donaciones, nombre_contacto_donaciones, numero_contacto_donaciones, numero_yape_plin, tiene_registro_completo, espacio_disponible, foto_perfil, contrasenia_hashed)  
values ('Albergue Amigos Fieles', 'Laura', 'García Pérez', 'Av. Siempre Viva 123', 2, 'amigosfieles@gmail.com', 6, 3, 'qwer1234', 0, '2024-05-31 18:59:30', 0, 1, '2024-05-31 18:29:30', 2018, 25, 'https://instagram.com/amigosfieles', 'Av. Donaciones 345', 'Laura García', '987654321', '937652321', 1, 20,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/logo_huellitas.png'),sha2("qwer1234", 256));

insert into mydb.Usuario(nombre_albergue, nombres_encargado, apellidos_encargado, direccion, id_rol, correo_electronico, id_distrito, id_zona, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, anio_creacion, cantidad_animales, url_instagram, direccion_donaciones, nombre_contacto_donaciones, numero_contacto_donaciones, numero_yape_plin, tiene_registro_completo, espacio_disponible, foto_perfil, contrasenia_hashed)
values ('Albergue Esperanza', 'Carlos', 'Sánchez López', 'Calle Amistad 456', 2, 'esperanza@gmail.com', 3, 3, 'qwer1234', 0, '2024-02-16 12:45:30', 0, 1, '2024-02-16 12:15:30', 2012, 135, 'https://instagram.com/albergueesperanza', 'Calle Donaciones 789', 'Juan Jose', '987654322', '933692322', 1, 34,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/logo_huellitas.png'),sha2("qwer1234", 256));

insert into mydb.Usuario(nombre_albergue, nombres_encargado, apellidos_encargado, direccion, id_rol, correo_electronico, id_distrito, id_zona, contrasenia, es_contrasenia_temporal, fecha_hora_expiracion_contrasenia, es_primera_contrasenia_temporal, es_usuario_activo, fecha_hora_creacion, anio_creacion, cantidad_animales, url_instagram, direccion_donaciones, nombre_contacto_donaciones, numero_contacto_donaciones, numero_yape_plin, tiene_registro_completo, espacio_disponible, foto_perfil, contrasenia_hashed)  
values('Refugio Patitas Felices', 'María', 'Rodríguez Salazar', 'Jr. Mascota 789', 2, 'patitasfelices@gmail.com', 4, 3, 'qwer1234', 0, '2024-04-02 16:40:30', 0, 1, '2024-04-02 16:10:30',2020, 60, 'https://instagram.com/patitasfelices', 'Jr. Donaciones 012', 'María Rodríguez', '999888777', '999555333', 1, 9,LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/logo_huellitas.png'),sha2("qwer1234", 256));

insert into mydb.Usuario(id_rol,nombres_coordinador, apellidos_coordinador,dni, numero_yape_plin,correo_electronico, id_zona, fecha_nacimiento,contrasenia, contrasenia_hashed, es_usuario_activo)
values	(3,'Jair Sneider', 'Aguilera Inca', '12345678','987654321','jasnai@gmail.com',1,'2004-02-13','jair1212',sha2("jair1212", 256),1),
		(3,'Diego Arturo', 'García Chávez', '12345672','987654321','diego@gmail.com',2,'2004-02-13','diego3434',sha2("diego3434", 256),1),
		(3,'David Matthew', 'Iturrizaga Robles', '12345673','987654321','david@gmail.com',3,'2004-02-13','david5656',sha2("david5656", 256),1),
        (3,'Alejaxander Manuel', 'Gutierrez Benavides', '12345674','987654321','alexander@gmail.com',4,'2004-02-13','alex7878',sha2("alex7878", 256),1);

-- Para administrador

insert into mydb.Usuario(id_rol, contrasenia, contrasenia_hashed, correo_electronico, es_usuario_activo) 
values(4, "petlink@2024", sha2("petlink@2024", 256), "petlink@gmail.com", 1);


-- Insertar 5 registros de denuncias por maltrato animal
INSERT INTO DenunciaMaltratoAnimal (nombre_foto_animal, foto_animal, tamanio, raza, descripcion_maltrato, nombre_maltratador, direccion_maltrato, es_denuncia_activa, fecha_hora_registro, id_usuario_final, id_estado)
VALUES 
('foto_perro1.jpg', NULL, 'Mediano', 'Mestizo', 'Perro golpeado repetidamente en la calle', 'Juan Pérez', 'Av. Siempre Viva 123', 1, '2024-01-15 14:23:00', 1, 2),
('foto_gato2.jpg', NULL, 'Pequeño', 'Siamés', 'Gato dejado sin comida por más de una semana', 'Carlos Gómez', 'Calle Amistad 456', 1, '2024-02-20 10:45:00', 3, 2),
('foto_caballo3.jpg', NULL, 'Grande', 'Criollo', 'Caballo utilizado en trabajos forzados sin descanso', 'Mario López', 'Jr. Mascota 789', 1, '2024-03-05 09:30:00', 1, 2),
('foto_perro4.jpg', NULL, 'Pequeño', 'Poodle', 'Perro dejado encerrado en un carro por varias horas', 'Sofía Méndez', 'Av. Brasil 1791', 1, '2024-04-01 12:15:00', 2, 1),
('foto_gato5.jpg', NULL, 'Mediano', 'Mestizo', 'Gato maltratado en una casa vecina', 'José Ramírez', 'Calle Donaciones 345', 0, '2024-04-15 11:00:00', 2, 3);

-- Insertar dos registros de puntos de acopio para dos albergues
INSERT INTO PuntoAcopio (direccion_punto_acopio, id_distrito, id_usuario_albergue)
VALUES 


-- Segundo albergue (id_usuario_albergue = 6)
('Calle Esperanza 789', 6, 6),
('Av. La Paz 101', 3, 6),
('Jr. Mexico 126', 4, 6);

-- Insertar tres solicitudes de donación económica
INSERT INTO SolicitudDonacionEconomica (monto_solicitado, motivo, es_solicitud_activa, fecha_hora_registro, id_usuario_albergue, id_estado)
VALUES 
(5000, 'Reparación de instalaciones del albergue', 1, '2024-06-15 10:30:00', 6, 2),
(3000, 'Compra de alimentos para los animales del albergue', 1, '2024-07-01 14:00:00', 6, 2),
(2000, 'Atención médica para los animales rescatados', 1, '2024-07-20 09:45:00', 6, 1);

-- Insetar 5 registros de donación económica para la primera solicitud
INSERT INTO RegistroDonacionEconomica (monto_donacion, fecha_hora_registro, id_solicitud_donacion_economica, id_usuario_final, id_estado)
VALUES 
(100, '2024-06-16 11:00:00', 1, 1, 1), -- Donación pendiente
(200, '2024-06-17 12:15:00', 1, 2, 1), -- Donación pendiente
(150, '2024-06-18 13:30:00', 1, 3, 1), -- Donación pendiente
(300, '2024-06-19 14:45:00', 1, 3, 2), -- Donación aprobada
(250, '2024-06-20 16:00:00', 1, 3, 3); -- Donación rechazada

-- Insertar una solicitud de donación de productos
INSERT INTO SolicitudDonacionProductos (descripcion_donaciones, es_solicitud_activa, fecha_hora_registro, id_usuario_albergue, id_estado)
VALUES ('Solicitamos productos de limpieza y alimento para los animales del albergue', 1, '2024-07-10 10:00:00', 6, 2),
	   ('Solicitamos alimento para los animales del albergue', 1, '2024-03-10 20:00:00', 6, 2), 
	   ('Solicitamos camas para perritos y gatitos', 1, '2024-09-12 17:00:00', 6, 2);
       
-- Insertar dos puntos de acopio de donación para la solicitud
INSERT INTO PuntoAcopioDonacion (id_punto_acopio, id_solicitud_donacion_productos)
VALUES 
(1, 1),  -- Primer punto de acopio del albergue 6, para la solicitud 1 
(2, 1);  -- Segundo punto de acopio del albergue 6, para la solicitud 2 

-- Insertar 2 horarios para cada punto de acopio de donación
INSERT INTO HorarioRecepcionDonacion (fecha_hora_inicio, fecha_hora_fin, id_punto_acopio_donacion)
VALUES 
('2024-11-02 09:00:00', '2024-11-02 12:00:00', 1), -- Dentro de 30 días: 9:00 AM - 12:00 PM
('2024-11-02 14:00:00', '2024-11-02 17:00:00', 1); -- Dentro de 30 días: 2:00 PM - 5:00 PM

INSERT INTO HorarioRecepcionDonacion (fecha_hora_inicio, fecha_hora_fin, id_punto_acopio_donacion)
VALUES 
('2024-11-02 09:00:00', '2024-11-02 12:00:00', 2), -- Dentro de 30 días: 9:00 AM - 12:00 PM
('2024-11-02 14:00:00', '2024-11-02 17:00:00', 2); -- Dentro de 30 días: 2:00 PM - 5:00 PM

-- Insertar tres registros de donacion en estado pendiente para el primer horario
INSERT INTO RegistroDonacionProductos (descripciones_donaciones, fecha_hora_registro, id_usuario_final, id_horario_recepcion_donacion, id_estado)
VALUES 
('Alimento para perros', '2024-11-02 09:15:00', 1, 1, 1),  -- Estado pendiente
('Juguetes y accesorios para mascotas', '2024-11-02 09:30:00', 3, 1, 1),  -- Estado aprobado
('Artículos de limpieza', '2024-11-02 10:00:00', 3, 1, 1);  -- Estado pendiente

-- Insertar 5 lugares de evento
INSERT INTO LugarEvento (direccion_lugar_evento, aforo_maximo, id_distrito)
VALUES 
('Av. Los Álamos 123', 200, 6),
('Jr. Las Flores 456', 150, 6),
('Calle Las Palmeras 789', 300, 6),
('Av. El Bosque 101', 250, 6),
('Jr. Las Acacias 202', 180, 6);

-- Insertar una publicación de evento benéfico
INSERT INTO PublicacionEventoBenefico (nombre_evento, fecha_hora_inicio_evento, fecha_hora_fin_evento, aforo_evento, entrada_evento, descripcion_evento, artistas_provedores_invitados, razon_evento, es_evento_activo, fecha_hora_registro, id_lugar_evento, id_usuario_albergue, id_estado)
VALUES 
('Evento de Recaudación para Albergue Esperanza', '2025-05-02 10:00:00', '2025-05-02 15:00:00', 200, 'Entrada libre', 'Recaudación de fondos para ayudar a los animales del albergue', 'Banda local, proveedores de comida', 'Recaudar fondos para gastos médicos y alimentos para los animales', 1, '2025-06-02 12:00:00', 1, 6, 2),
('Evento Rifa de Mascotas de Esperanza', '2025-07-02 10:00:00', '2025-07-02 15:00:00', 200, 'Entrada libre', 'Recaudación de fondos para ayudar a los animales del albergue', 'Banda local, proveedores de comida', 'Recaudar vívives para las masoctas', 1, '2025-06-02 12:00:00', 1, 6, 2),
('Evento de Recaudación para Albergue Amigos Fieles', '2025-11-11 10:00:00', '2025-11-11 15:00:00', 200, 'Entrada libre', 'Recaudación de fondos para ayudar a los animales del albergue', 'Banda local, proveedores de comida', 'Recaudar fondos para gastos médicos y alimentos para los animales', 1, '2025-04-02 12:00:00', 1, 7, 1);

-- Insertar 5 inscripciones a eventos benéficos
INSERT INTO InscripcionEventoBenefico (fecha_hora_registro, id_evento_benefico, id_usuario_final)
VALUES 
('2024-10-02 14:00:00', 1, 1),  -- Usuario 1 inscrito
('2024-10-02 14:05:00', 1, 2),  -- Usuario 2 inscrito
('2024-10-02 14:10:00', 1, 3),  -- Usuario 3 inscrito
('2024-10-02 14:15:00', 1, 4),  -- Usuario 4 inscrito
('2024-10-02 14:20:00', 1, 5);  -- Usuario 5 inscrito

-- Insertar una publicación de mascota perdida del dueño y una de un tercero que actualiza a la del dueño
INSERT INTO PublicacionMascotaPerdida (descripcion_mascota, foto_mascota, nombre_foto_mascota, nombre, edad_mascota, raza_mascota, tamanio_mascota, lugar_perdida, fecha_perdida, celular_contacto, nombre_contacto, recompensa, es_publicacion_activa, fecha_hora_registro, id_tipo_publicacion_mascota_perdida, id_usuario, id_estado, id_publicacion_ultima_actualizacion, fecha_hora_ultima_actualizacion, fue_encontrada)
VALUES 
('Perro pequeño visto en la esquina de Calle Esperanza', NULL, 'foto_perro_calle.jpg', 'Charles', NULL, NULL, NULL, 'Calle Esperanza', NULL, NULL, NULL, NULL, 1, NOW(), 2, 3, 2, NULL, NULL, 0),
('Perro perdido en la zona del parque central', NULL, 'foto_perro_perdido.jpg', 'Firulais', '3', 'Labrador', 'Mediano', 'Parque Central', '2024-09-30', '987654321', 'Juan Pérez', 500, 1, '2024-09-30 10:00:00', 1, 1, 2, 1, '2024-10-01 18:00:00', 0);

INSERT INTO PublicacionMascotaAdopcion (nombre_mascota, tipo_raza, lugar_encontrado, descripcion_mascota, edad_aproximada, genero_mascota, foto_mascota, nombre_foto_mascota, esta_en_temporal, condiciones_adopcion, es_publicacion_activa, fecha_hora_registro, id_usuario_albergue, id_estado)
VALUES 
("Pepe", 'Mestizo', 'Parque Los Álamos', 'Perro juguetón y amigable, ideal para familias con niños', '3', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion3.png'), 'foto_perro1.jpg', 0, 'Debe tener un patio grande', 1, '2024-10-02 12:00:00', 6, 2),

("Trufa", 'Labrador', 'Calle Las Flores', 'Perro labrador muy cariñoso, le encanta jugar y es muy obediente', '2', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion4.png'), 'foto_perro2.jpg', 0, 'Debe tener espacio suficiente para correr', 1, '2024-10-02 12:10:00', 6, 2),

("Alejandro", 'Siamés', 'Jr. Las Acacias', 'Gato siamés tranquilo, ideal para apartamentos y casas pequeñas', '4', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion5.png'), 'foto_gato1.jpg', 1, 'Preferiblemente para personas sin otras mascotas', 1, '2024-10-02 12:20:00', 6, 2),

("Maxwell", 'Mestizo', 'Av. La Paz', 'Gatito juguetón y curioso, ideal para familias que deseen compañía', '1', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion6.png'), 'foto_gato2.jpg', 0, 'Requiere espacio seguro dentro del hogar', 1, '2024-10-02 12:30:00', 6, 2),

("Luna", 'Golden Retriever', 'Parque San Martín', 'Golden juguetona y cariñosa, ideal para familias con niños', '5', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/apolo.png'), 'foto_perro3.jpg', 0, 'Debe tener un patio amplio', 1, '2024-10-02 12:40:00', 6, 2),

("Toby", 'Pastor Alemán', 'Calle Los Olivos', 'Pastor alemán leal y protector, requiere entrenamiento constante', '3', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion3.png'), 'foto_perro4.jpg', 1, 'Debe estar en un ambiente seguro', 1, '2024-10-02 12:50:00', 6, 2),

("Mia", 'Persa', 'Av. Primavera', 'Gata persa dulce y tranquila, ideal para interiores', '2', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion4.png'), 'foto_gato3.jpg', 0, 'Preferiblemente hogar sin otros gatos', 1, '2024-10-02 13:00:00', 6, 2),

("Rocky", 'Pitbull', 'Parque Central', 'Pitbull amigable y enérgico, necesita actividad constante', '4', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion5.png'), 'foto_perro5.jpg', 0, 'Dueño con experiencia en perros', 1, '2024-10-02 13:10:00', 6, 2),

("Bella", 'Beagle', 'Jr. Los Rosales', 'Beagle juguetona y exploradora, ideal para familias', '1', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion6.png'), 'foto_perro6.jpg', 0, 'Debe tener supervisión constante', 1, '2024-10-02 13:20:00', 6, 2),

("Simba", 'Bengala', 'Calle Primavera', 'Gato bengala curioso y activo, ideal para familias jóvenes', '3', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/apolo.png'), 'foto_gato4.jpg', 1, 'Requiere mucho entretenimiento', 1, '2024-10-02 13:30:00', 6, 2),

("Canela", 'Bulldog Francés', 'Parque Kennedy', 'Bulldog francés amigable, ideal para departamentos', '2', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion3.png'), 'foto_perro7.jpg', 0, 'Requiere supervisión por su raza', 1, '2024-10-02 13:40:00', 6, 2),

("Oscar", 'Himalayo', 'Av. Los Pinos', 'Gato himalayo muy cariñoso, busca hogar tranquilo', '5', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion4.png'), 'foto_gato5.jpg', 1, 'Hogar sin niños pequeños', 1, '2024-10-02 13:50:00', 6, 2);

-- Generamos 5 postulaciones para adopción

INSERT INTO PostulacionMascotaAdopcion (fecha_hora_registro, id_publicacion_mascota_adopcion, id_usuario_final, id_estado)
VALUES 
('2024-10-03 09:00:00', 1, 1, 1),  -- Postulación del usuario 1
('2024-10-03 09:05:00', 1, 2, 1),  -- Postulación del usuario 2
('2024-10-03 09:10:00', 1, 3, 1),  -- Postulación del usuario 3
('2024-10-03 09:15:00', 1, 4, 1),  -- Postulación del usuario 4
('2024-10-03 09:20:00', 1, 5, 1),  -- Postulación del usuario 5
('2024-10-03 09:00:00', 2, 1, 1),  -- Postulación del usuario 1
('2024-10-03 09:15:00', 3, 1, 1),  -- Postulación del usuario 1
('2024-10-03 09:40:00', 4, 1, 1),  -- Postulación del usuario 1
('2024-10-03 09:31:00', 5, 1, 1);  -- Postulación del usuario 1

-- Genero publicaciones de mascotas en adopcion adicionales 

INSERT INTO PublicacionMascotaAdopcion (nombre_mascota, tipo_raza, lugar_encontrado, descripcion_mascota, edad_aproximada, genero_mascota, foto_mascota, nombre_foto_mascota, esta_en_temporal, condiciones_adopcion, es_publicacion_activa, fecha_hora_registro, id_usuario_albergue, id_estado)
VALUES 
("Lola", 'Bulldog Francés', 'Av. Independencia', 'Bulldog tranquila y cariñosa, ideal para espacios pequeños', '3', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion3.png'), 'foto_perro7.jpg', 1, 'Debe tener supervisión médica regular', 1, '2024-10-02 13:40:00', 6, 2),

("Coco", 'Husky Siberiano', 'Parque Primavera', 'Husky enérgico y amigable, ideal para personas activas', '2', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion4.png'), 'foto_perro8.jpg', 0, 'Necesita ejercicio diario', 1, '2024-10-02 13:50:00', 6, 2),

("Nina", 'Mestizo', 'Jr. Los Tulipanes', 'Perrita dulce y juguetona, ideal para interiores', '1', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion6.png'), 'foto_perro9.jpg', 0, 'Hogar tranquilo y sin niños pequeños', 1, '2024-10-02 14:00:00', 6, 2),

("Zeus", 'Dóberman', 'Av. Libertad', 'Perro protector y leal, ideal para personas experimentadas', '4', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion5.png'), 'foto_perro10.jpg', 1, 'Requiere espacio amplio y entrenamiento', 1, '2024-10-02 14:10:00', 6, 2),

("Kira", 'Ragdoll', 'Calle Los Pinos', 'Gata muy cariñosa, ideal para familias que busquen compañía', '2', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/apolo.png'), 'foto_gato5.jpg', 1, 'Ideal en un hogar tranquilo', 1, '2024-10-02 14:20:00', 6, 2),

("Buddy", 'Golden Retriever', 'Parque de la Amistad', 'Perro amistoso y leal, ideal para familias activas', '3', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion4.png'), 'foto_perro11.jpg', 0, 'Debe tener acceso a espacio al aire libre', 1, '2024-10-02 14:30:00', 6, 2),

("Molly", 'Siberiano', 'Av. Los Laureles', 'Gato independiente y curioso, perfecto para interiores', '4', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion3.png'), 'foto_gato6.jpg', 0, 'Ideal para personas que vivan solas', 1, '2024-10-02 14:40:00', 6, 2),

("Thor", 'Rottweiler', 'Calle Amazonas', 'Perro fuerte y protector, necesita dueño experimentado', '5', 'Macho', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/apolo.png'), 'foto_perro12.jpg', 1, 'Debe tener un espacio cerrado y seguro', 1, '2024-10-02 14:50:00', 6, 2),

("Olivia", 'Yorkshire Terrier', 'Parque Los Robles', 'Perrita pequeña y juguetona, ideal para interiores', '1', 'Hembra', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/adopcion3.png'), 'foto_perro13.jpg', 0, 'Preferiblemente hogar sin niños', 1, '2024-10-02 15:00:00', 6, 2);

