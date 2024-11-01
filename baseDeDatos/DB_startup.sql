-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT,
  `nombre_rol` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Zona` (
  `id_zona` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_zona` VARCHAR(45) NULL,
  PRIMARY KEY (`id_zona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Distrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Distrito` (
  `id_distrito` INT NOT NULL AUTO_INCREMENT,
  `nombre_distrito` VARCHAR(45) NULL,
  `id_zona` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_distrito`),
  INDEX `fk_Distrito_Zona1_idx` (`id_zona` ASC) VISIBLE,
  CONSTRAINT `fk_Distrito_Zona1`
    FOREIGN KEY (`id_zona`)
    REFERENCES `mydb`.`Zona` (`id_zona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estado` (
  `id_estado` INT UNSIGNED NOT NULL,
  `nombre_estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PostulacionHogarTemporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PostulacionHogarTemporal` (
  `id_postulacion_hogar_temporal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `edad_usuario` VARCHAR(3) NULL,
  `genero_usuario` VARCHAR(45) NULL,
  `celular_usuario` VARCHAR(9) NULL,
  `cantidad_cuartos` VARCHAR(2) NULL,
  `metraje_vivienda` VARCHAR(10) NULL,
  `tiene_mascotas` TINYINT NULL,
  `tipo_mascotas` VARCHAR(300) NULL,
  `tiene_hijos` TINYINT NULL,
  `tiene_dependientes` TINYINT NULL,
  `forma_trabajo` VARCHAR(45) NULL,
  `nombre_persona_referencia` VARCHAR(45) NULL,
  `celular_persona_referencia` VARCHAR(9) NULL,
  `fecha_inicio_temporal` DATE NULL,
  `fecha_fin_temporal` DATE NULL,
  `fecha_hora_registro` DATETIME NULL,
  `cantidad_rechazos_consecutivos` INT(1) NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  `llamo_al_postulante` TINYINT NULL DEFAULT 0,
  `fecha_visita` DATE NULL,
  PRIMARY KEY (`id_postulacion_hogar_temporal`),
  INDEX `fk_PostulacionHogarTemporal_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  INDEX `fk_PostulacionHogarTemporal_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_PostulacionHogarTemporal_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostulacionHogarTemporal_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id_usuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dni` VARCHAR(8) NULL,
  `nombres_usuario_final` VARCHAR(45) NULL,
  `apellidos_usuario_final` VARCHAR(45) NULL,
  `direccion` VARCHAR(100) NULL,
  `id_rol` INT NOT NULL,
  `correo_electronico` VARCHAR(100) NULL,
  `foto_perfil` BLOB NULL,
  `nombre_foto_perfil` VARCHAR(100) NULL,
  `contrasenia` VARCHAR(100) NULL,
  `es_contrasenia_temporal` TINYINT NULL,
  `fecha_hora_expiracion_contrasenia` DATETIME NULL,
  `es_primera_contrasenia_temporal` TINYINT NULL,
  `es_usuario_activo` TINYINT NULL,
  `fecha_hora_creacion` DATETIME NULL,
  `fecha_hora_eliminacion` DATETIME NULL,
  `nombre_albergue` VARCHAR(45) NULL,
  `nombres_encargado` VARCHAR(45) NULL,
  `apellidos_encargado` VARCHAR(45) NULL,
  `anio_creacion` VARCHAR(4) NULL,
  `cantidad_animales` INT NULL,
  `espacio_disponible` INT NULL,
  `url_instagram` VARCHAR(200) NULL,
  `foto_de_portada_albergue` BLOB NULL,
  `nombre_foto_de_portada` VARCHAR(100) NULL,
  `logo_albergue` BLOB NULL,
  `nombre_logo_albergue` VARCHAR(100) NULL,
  `direccion_donaciones` VARCHAR(150) NULL,
  `nombre_contacto_donaciones` VARCHAR(45) NULL,
  `numero_contacto_donaciones` VARCHAR(9) NULL,
  `numero_yape_plin` VARCHAR(9) NULL,
  `nombre_imagen_qr` VARCHAR(100) NULL,
  `imagen_qr` BLOB NULL,
  `tiene_registro_completo` TINYINT NULL,
  `nombres_coordinador` VARCHAR(45) NULL,
  `apellidos_coordinador` VARCHAR(45) NULL,
  `fecha_nacimiento` DATE NULL,
  `id_distrito` INT NOT NULL,
  `id_zona` INT UNSIGNED NOT NULL,
  `id_ultima_postulacion_hogar_temporal` INT UNSIGNED NULL,
  `descripcion_perfil` VARCHAR(1000) NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_Usuario_Rol_idx` (`id_rol` ASC) VISIBLE,
  INDEX `fk_Usuario_Distrito1_idx` (`id_distrito` ASC) VISIBLE,
  INDEX `fk_Usuario_Zona1_idx` (`id_zona` ASC) VISIBLE,
  INDEX `fk_Usuario_PostulacionHogarTemporal1_idx` (`id_ultima_postulacion_hogar_temporal` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_Rol`
    FOREIGN KEY (`id_rol`)
    REFERENCES `mydb`.`Rol` (`id_rol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Distrito1`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `mydb`.`Distrito` (`id_distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Zona1`
    FOREIGN KEY (`id_zona`)
    REFERENCES `mydb`.`Zona` (`id_zona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_PostulacionHogarTemporal1`
    FOREIGN KEY (`id_ultima_postulacion_hogar_temporal`)
    REFERENCES `mydb`.`PostulacionHogarTemporal` (`id_postulacion_hogar_temporal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PuntoAcopio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PuntoAcopio` (
  `id_punto_acopio` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `direccion_punto_acopio` VARCHAR(100) NULL,
  `id_distrito` INT NOT NULL,
  `id_usuario_albergue` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_punto_acopio`),
  INDEX `fk_PuntoAcopio_Distrito1_idx` (`id_distrito` ASC) VISIBLE,
  INDEX `fk_PuntoAcopio_Usuario1_idx` (`id_usuario_albergue` ASC) VISIBLE,
  CONSTRAINT `fk_PuntoAcopio_Distrito1`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `mydb`.`Distrito` (`id_distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PuntoAcopio_Usuario1`
    FOREIGN KEY (`id_usuario_albergue`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`LugarEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`LugarEvento` (
  `id_lugar_evento` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_lugar_evento` VARCHAR(60) NULL,
  `direccion_lugar_evento` VARCHAR(100) NULL,
  `aforo_maximo` INT NULL,
  `id_distrito` INT NOT NULL,
  PRIMARY KEY (`id_lugar_evento`),
  INDEX `fk_LugarEvento_Distrito1_idx` (`id_distrito` ASC) VISIBLE,
  CONSTRAINT `fk_LugarEvento_Distrito1`
    FOREIGN KEY (`id_distrito`)
    REFERENCES `mydb`.`Distrito` (`id_distrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BaneoHogarTemporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BaneoHogarTemporal` (
  `id_baneo_hogar_temporal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `motivo` VARCHAR(300) NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  `tipo_de_baneo` TINYINT NULL COMMENT 'Null: No baneado\n0: Baneado de forma automática (Sistema)\n1: Baneado de forma manual (Coordinador Zonal)',
  PRIMARY KEY (`id_baneo_hogar_temporal`),
  INDEX `fk_Baneo_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  CONSTRAINT `fk_Baneo_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DenunciaMaltratoAnimal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DenunciaMaltratoAnimal` (
  `id_denuncia_maltrato_animal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_foto_animal` VARCHAR(100) NULL,
  `foto_animal` BLOB NULL,
  `tamanio` VARCHAR(45) NULL,
  `raza` VARCHAR(45) NULL,
  `descripcion_maltrato` VARCHAR(300) NULL,
  `nombre_maltratador` VARCHAR(45) NULL,
  `direccion_maltrato` VARCHAR(100) NULL,
  `es_denuncia_activa` TINYINT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  `tiene_denuncia_policial` TINYINT NULL,
  PRIMARY KEY (`id_denuncia_maltrato_animal`),
  INDEX `fk_DenunciaMaltratoAnimal_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  INDEX `fk_DenunciaMaltratoAnimal_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_DenunciaMaltratoAnimal_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DenunciaMaltratoAnimal_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FotoPostulacionHogarTemporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FotoPostulacionHogarTemporal` (
  `id_foto_postulacion_hogar_temporal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `foto_lugar_temporal` BLOB NULL,
  `nombre_foto_lugar_temporal` VARCHAR(45) NULL,
  `id_postulacion_hogar_temporal` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_foto_postulacion_hogar_temporal`),
  INDEX `fk_FotoPostulacionHogarTemporal_PostulacionHogarTemporal1_idx` (`id_postulacion_hogar_temporal` ASC) VISIBLE,
  CONSTRAINT `fk_FotoPostulacionHogarTemporal_PostulacionHogarTemporal1`
    FOREIGN KEY (`id_postulacion_hogar_temporal`)
    REFERENCES `mydb`.`PostulacionHogarTemporal` (`id_postulacion_hogar_temporal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SolicitudHogarTemporal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SolicitudHogarTemporal` (
  `id_solicitud_hogar_temporal` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `foto_mascota` BLOB NULL,
  `nombre_foto_mascota` VARCHAR(45) NULL,
  `nombre_mascota` VARCHAR(45) NULL,
  `descripcion_mascota` VARCHAR(300) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_postulacion_hogar_temporal` INT UNSIGNED NOT NULL,
  `id_usuario_albergue` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_solicitud_hogar_temporal`),
  INDEX `fk_SolicitudTemporal_PostulacionHogarTemporal1_idx` (`id_postulacion_hogar_temporal` ASC) VISIBLE,
  INDEX `fk_SolicitudTemporal_Usuario1_idx` (`id_usuario_albergue` ASC) VISIBLE,
  INDEX `fk_SolicitudHogarTemporal_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_SolicitudTemporal_PostulacionHogarTemporal1`
    FOREIGN KEY (`id_postulacion_hogar_temporal`)
    REFERENCES `mydb`.`PostulacionHogarTemporal` (`id_postulacion_hogar_temporal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SolicitudTemporal_Usuario1`
    FOREIGN KEY (`id_usuario_albergue`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SolicitudHogarTemporal_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PublicacionMascotaAdopcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PublicacionMascotaAdopcion` (
  `id_publicacion_mascota_adopcion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_raza` VARCHAR(45) NULL,
  `lugar_encontrado` VARCHAR(100) NULL,
  `descripcion_mascota` VARCHAR(300) NULL,
  `edad_aproximada` VARCHAR(2) NULL,
  `genero_mascota` VARCHAR(45) NULL,
  `foto_mascota` BLOB NULL,
  `nombre_foto_mascota` VARCHAR(45) NULL,
  `esta_en_temporal` TINYINT NULL,
  `condiciones_adopcion` VARCHAR(300) NULL,
  `es_publicacion_activa` TINYINT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_usuario_albergue` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  `nombre_mascota` VARCHAR(45) NULL,
  `id_adoptante` INT UNSIGNED NULL,
  PRIMARY KEY (`id_publicacion_mascota_adopcion`),
  INDEX `fk_PublicacionMascotaAdopcion_Usuario1_idx` (`id_usuario_albergue` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaAdopcion_Estado1_idx` (`id_estado` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaAdopcion_Usuario2_idx` (`id_adoptante` ASC) VISIBLE,
  CONSTRAINT `fk_PublicacionMascotaAdopcion_Usuario1`
    FOREIGN KEY (`id_usuario_albergue`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PublicacionMascotaAdopcion_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PublicacionMascotaAdopcion_Usuario2`
    FOREIGN KEY (`id_adoptante`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PublicacionEventoBenefico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PublicacionEventoBenefico` (
  `id_publicacion_evento_benefico` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre_evento` VARCHAR(100) NULL,
  `fecha_hora_inicio_evento` DATETIME NULL,
  `fecha_hora_fin_evento` DATETIME NULL,
  `aforo_evento` INT NULL,
  `entrada_evento` VARCHAR(100) NULL,
  `descripcion_evento` VARCHAR(500) NULL,
  `artistas_provedores_invitados` VARCHAR(300) NULL,
  `razon_evento` VARCHAR(500) NULL,
  `es_evento_activo` TINYINT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_lugar_evento` INT UNSIGNED NOT NULL,
  `id_usuario_albergue` INT UNSIGNED NOT NULL,
  `foto` BLOB NULL,
  `nombre_foto` VARCHAR(100) NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_publicacion_evento_benefico`),
  INDEX `fk_EventoBenefico_LugarEvento1_idx` (`id_lugar_evento` ASC) VISIBLE,
  INDEX `fk_EventoBenefico_Usuario1_idx` (`id_usuario_albergue` ASC) VISIBLE,
  INDEX `fk_PublicacionEventoBenefico_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_EventoBenefico_LugarEvento1`
    FOREIGN KEY (`id_lugar_evento`)
    REFERENCES `mydb`.`LugarEvento` (`id_lugar_evento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventoBenefico_Usuario1`
    FOREIGN KEY (`id_usuario_albergue`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PublicacionEventoBenefico_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SolicitudDonacionProductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SolicitudDonacionProductos` (
  `id_solicitud_donacion_productos` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion_donaciones` VARCHAR(500) NULL,
  `es_solicitud_activa` TINYINT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_usuario_albergue` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_solicitud_donacion_productos`),
  INDEX `fk_SolicitudDonacionProductos_Usuario1_idx` (`id_usuario_albergue` ASC) VISIBLE,
  INDEX `fk_SolicitudDonacionProductos_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_SolicitudDonacionProductos_Usuario1`
    FOREIGN KEY (`id_usuario_albergue`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SolicitudDonacionProductos_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PuntoAcopioDonacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PuntoAcopioDonacion` (
  `id_punto_acopio_donacion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_solicitud_donacion_productos` INT UNSIGNED NOT NULL,
  `id_punto_acopio` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_punto_acopio_donacion`),
  INDEX `fk_PuntoAcopioDonacion_SolicitudDonacionProductos1_idx` (`id_solicitud_donacion_productos` ASC) VISIBLE,
  INDEX `fk_PuntoAcopioDonacion_PuntoAcopio1_idx` (`id_punto_acopio` ASC) VISIBLE,
  CONSTRAINT `fk_PuntoAcopioDonacion_SolicitudDonacionProductos1`
    FOREIGN KEY (`id_solicitud_donacion_productos`)
    REFERENCES `mydb`.`SolicitudDonacionProductos` (`id_solicitud_donacion_productos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PuntoAcopioDonacion_PuntoAcopio1`
    FOREIGN KEY (`id_punto_acopio`)
    REFERENCES `mydb`.`PuntoAcopio` (`id_punto_acopio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HorarioRecepcionDonacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HorarioRecepcionDonacion` (
  `id_horario_recepcion_donacion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_hora_inicio` DATETIME NULL,
  `fecha_hora_fin` DATETIME NULL,
  `id_punto_acopio_donacion` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_horario_recepcion_donacion`),
  INDEX `fk_HorarioRecepcionDonacion_PuntoAcopioDonacion1_idx` (`id_punto_acopio_donacion` ASC) VISIBLE,
  CONSTRAINT `fk_HorarioRecepcionDonacion_PuntoAcopioDonacion1`
    FOREIGN KEY (`id_punto_acopio_donacion`)
    REFERENCES `mydb`.`PuntoAcopioDonacion` (`id_punto_acopio_donacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PostulacionMascotaAdopcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PostulacionMascotaAdopcion` (
  `id_postulacion_mascota_adopcion` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_hora_registro` DATETIME NULL,
  `id_publicacion_mascota_adopcion` INT UNSIGNED NOT NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_postulacion_mascota_adopcion`),
  INDEX `fk_PostulacionMascotaAdopcion_PublicacionMascotaAdopcion1_idx` (`id_publicacion_mascota_adopcion` ASC) VISIBLE,
  INDEX `fk_PostulacionMascotaAdopcion_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  INDEX `fk_PostulacionMascotaAdopcion_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_PostulacionMascotaAdopcion_PublicacionMascotaAdopcion1`
    FOREIGN KEY (`id_publicacion_mascota_adopcion`)
    REFERENCES `mydb`.`PublicacionMascotaAdopcion` (`id_publicacion_mascota_adopcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostulacionMascotaAdopcion_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PostulacionMascotaAdopcion_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoPublicacionMascotaPerdida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoPublicacionMascotaPerdida` (
  `id_tipo_publicacion_mascota_perdida` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_publicacion` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo_publicacion_mascota_perdida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PublicacionMascotaPerdida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PublicacionMascotaPerdida` (
  `id_publicacion_mascota_perdida` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripcion_mascota` VARCHAR(300) NULL,
  `foto_mascota` BLOB NULL,
  `nombre_foto_mascota` VARCHAR(100) NULL,
  `nombre` VARCHAR(45) NULL,
  `edad_mascota` VARCHAR(2) NULL,
  `raza_mascota` VARCHAR(45) NULL,
  `tamanio_mascota` VARCHAR(45) NULL,
  `lugar_perdida` VARCHAR(45) NULL,
  `fecha_perdida` DATE NULL,
  `celular_contacto` VARCHAR(9) NULL,
  `nombre_contacto` VARCHAR(45) NULL,
  `recompensa` INT NULL,
  `es_publicacion_activa` TINYINT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_tipo_publicacion_mascota_perdida` INT UNSIGNED NOT NULL,
  `id_usuario` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  `id_publicacion_ultima_actualizacion` INT UNSIGNED NULL,
  `fecha_hora_ultima_actualizacion` VARCHAR(45) NULL,
  `fue_encontrada` TINYINT NULL,
  PRIMARY KEY (`id_publicacion_mascota_perdida`),
  INDEX `fk_PublicacionMascotaPerdida_TipoPublicacionMascotaPerdida1_idx` (`id_tipo_publicacion_mascota_perdida` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaPerdida_Usuario1_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaPerdida_Estado1_idx` (`id_estado` ASC) VISIBLE,
  INDEX `fk_PublicacionMascotaPerdida_PublicacionMascotaPerdida1_idx` (`id_publicacion_ultima_actualizacion` ASC) VISIBLE,
  CONSTRAINT `fk_PublicacionMascotaPerdida_TipoPublicacionMascotaPerdida1`
    FOREIGN KEY (`id_tipo_publicacion_mascota_perdida`)
    REFERENCES `mydb`.`TipoPublicacionMascotaPerdida` (`id_tipo_publicacion_mascota_perdida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PublicacionMascotaPerdida_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PublicacionMascotaPerdida_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PublicacionMascotaPerdida_PublicacionMascotaPerdida1`
    FOREIGN KEY (`id_publicacion_ultima_actualizacion`)
    REFERENCES `mydb`.`PublicacionMascotaPerdida` (`id_publicacion_mascota_perdida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InscripcionEventoBenefico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InscripcionEventoBenefico` (
  `id_inscripcion_evento_benefico` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fecha_hora_registro` DATETIME NULL,
  `id_evento_benefico` INT UNSIGNED NOT NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_inscripcion_evento_benefico`),
  INDEX `fk_InscripcionEventoBenefico_EventoBenefico1_idx` (`id_evento_benefico` ASC) VISIBLE,
  INDEX `fk_InscripcionEventoBenefico_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  CONSTRAINT `fk_InscripcionEventoBenefico_EventoBenefico1`
    FOREIGN KEY (`id_evento_benefico`)
    REFERENCES `mydb`.`PublicacionEventoBenefico` (`id_publicacion_evento_benefico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InscripcionEventoBenefico_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SolicitudDonacionEconomica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SolicitudDonacionEconomica` (
  `id_solicitud_donacion_economica` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `monto_solicitado` INT NULL,
  `motivo` VARCHAR(300) NULL,
  `es_solicitud_activa` TINYINT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_usuario_albergue` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_solicitud_donacion_economica`),
  INDEX `fk_SolicitudDonacionEconomica_Usuario1_idx` (`id_usuario_albergue` ASC) VISIBLE,
  INDEX `fk_SolicitudDonacionEconomica_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_SolicitudDonacionEconomica_Usuario1`
    FOREIGN KEY (`id_usuario_albergue`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SolicitudDonacionEconomica_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroDonacionEconomica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroDonacionEconomica` (
  `id_registro_donacion_economica` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `monto_donacion` INT NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_solicitud_donacion_economica` INT UNSIGNED NOT NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_registro_donacion_economica`),
  INDEX `fk_RegistroDonacionEconomica_SolicitudDonacionEconomica1_idx` (`id_solicitud_donacion_economica` ASC) VISIBLE,
  INDEX `fk_RegistroDonacionEconomica_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  INDEX `fk_RegistroDonacionEconomica_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroDonacionEconomica_SolicitudDonacionEconomica1`
    FOREIGN KEY (`id_solicitud_donacion_economica`)
    REFERENCES `mydb`.`SolicitudDonacionEconomica` (`id_solicitud_donacion_economica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RegistroDonacionEconomica_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RegistroDonacionEconomica_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`RegistroDonacionProductos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`RegistroDonacionProductos` (
  `id_registro_donacion_productos` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `descripciones_donaciones` VARCHAR(500) NULL,
  `fecha_hora_registro` DATETIME NULL,
  `id_usuario_final` INT UNSIGNED NOT NULL,
  `id_horario_recepcion_donacion` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_registro_donacion_productos`),
  INDEX `fk_RegistroDonacionProductos_Usuario1_idx` (`id_usuario_final` ASC) VISIBLE,
  INDEX `fk_RegistroDonacionProductos_HorarioRecepcionDonacion1_idx` (`id_horario_recepcion_donacion` ASC) VISIBLE,
  INDEX `fk_RegistroDonacionProductos_Estado1_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_RegistroDonacionProductos_Usuario1`
    FOREIGN KEY (`id_usuario_final`)
    REFERENCES `mydb`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RegistroDonacionProductos_HorarioRecepcionDonacion1`
    FOREIGN KEY (`id_horario_recepcion_donacion`)
    REFERENCES `mydb`.`HorarioRecepcionDonacion` (`id_horario_recepcion_donacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RegistroDonacionProductos_Estado1`
    FOREIGN KEY (`id_estado`)
    REFERENCES `mydb`.`Estado` (`id_estado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
