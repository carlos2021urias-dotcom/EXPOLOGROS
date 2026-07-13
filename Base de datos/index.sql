CREATE DATABASE amonos;
 
USE amonos;
 
CREATE TABLE usuarios(
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(100), NOT NULL
	correo VARCHAR(200), 
	password_hash VARCHAR(255),
	estado ENUM(
	'activo',
	'suspendido'
	)DEFAULT 'activo'
);
 
CREATE TABLE resenas(
	id_resena INT PRIMARY KEY AUTO_INCREMENT,
	id_usuario INT NOT NULL,
	puntuacion INT,
	comentario TEXT,
	fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);
 
 
CREATE TABLE favoritos(
	id_favorito INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT NOT NULL,
	id_destino INT NOT NULL,
	fecha_agregado DATETIME DEFAULT CURRENT_TIMESTAMP
 
);
 
CREATE TABLE historial_visitas(
	id_visita INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT NOT NULL,
	id_destino INT NOT NULL,
	fecha_visita DATE NOT NULL,
	calificacion TINYINT NULL,
	gasto_total DECIMAL(10,2)
);
 
CREATE TABLE presupuestos_viaje(
	id_presupuesto INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT NOT NULL,
	id_destino INT NOT NULL,
	nombre_presupuesto VARCHAR(100) NULL,
	cantidad_personas INT NOT NULL DEFAULT 1,
	incluir_entrada BOOLEAN DEFAULT TRUE,
	incluir_comida BOOLEAN DEFAULT TRUE,
	incluir_parqueo BOOLEAN DEFAULT FALSE,
	incluir_hospedaje BOOLEAN DEFAULT FALSE,
	costo_entrada DECIMAL(10,2) DEFAULT 0,
	costo_comida DECIMAL(10,2) DEFAULT 0,
	costo_parqueo DECIMAL(10,2) DEFAULT 0,
	costo_hospedaje DECIMAL(10,2) DEFAULT 0,
	presupuesto_usuario DECIMAL(10,2) NOT NULL,
	costo_estimado DECIMAL(10,2) NOT NULL,
	dinero_restante DECIMAL(10,2) NOT NULL,
	fecha_calculo DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE destinos(
	id_destino INT AUTO_INCREMENT PRIMARY KEY,
	id_categoria INT NOT NULL,
	nombre VARCHAR(150) NOT NULL,
	descripcion TEXT,
	departamento VARCHAR(100),
	direccion VARCHAR(255),
	latitud DECIMAL(10,8),
	longitud DECIMAL(11,8),
	precio_entrada DECIMAL(10,2),
	precio_comida DECIMAL(10,2),
	precio_parqueo DECIMAL(10,2),
	precio_hospedaje DECIMAL(10,2),
	tipo_visitante ENUM(
	'familia',
	'jovenes',
	'pareja',
	'todos'
	)DEFAULT 'todos'
);

CREATE TABLE categorias_destino(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	nombre_categoria VARCHAR(100) NOT NULL UNIQUE,
	icono VARCHAR(100) NULL
);

CREATE TABLE imagenes_destino(
	id_imagen INT AUTO_INCREMENT PRIMARY KEY,
	id_destino INT NOT NULL,
	imagen_url VARCHAR(255)
);

CREATE TABLE actividades(
	id_actividad INT AUTO_INCREMENT PRIMARY KEY,
	id_destino INT NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	actividad_seleccionar ENUM(
	'kayak',
	'jet ski',
	'nadar',
	'paseo en lancha',
	'restaurante'
);



