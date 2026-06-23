-- Sky Lost Database
CREATE DATABASE IF NOT EXISTS skylost_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE skylost_db;

-- ─── Tabla Usuarios ───────────────────────────────────────────
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    correo VARCHAR(150) UNIQUE NOT NULL,
    contrasenia VARCHAR(255) NOT NULL,
    rol VARCHAR(20) DEFAULT 'Usuario',
    nombre VARCHAR(100),
    apellidos VARCHAR(150),
    celular VARCHAR(20),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ─── Tabla Objetos ────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS objetos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500),
    ubicacion VARCHAR(150),
    estado VARCHAR(20) DEFAULT 'Perdido',
    imagen LONGTEXT,
    usuario_id INT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    nota_devolucion VARCHAR(500) NULL,
    fecha_devolucion DATETIME NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE SET NULL
);

-- ─── Admin por defecto ────────────────────────────────────────
INSERT INTO usuarios (correo, contrasenia, rol, nombre, apellidos, celular)
VALUES ('admin@skylost.com', 'admin123', 'Admin', 'Administrador', 'Sky Lost', '999000000')
ON DUPLICATE KEY UPDATE correo = correo;
