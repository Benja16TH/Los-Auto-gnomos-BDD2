CREATE TABLE Clientes (
    id_clientes SERIAL PRIMARY KEY,
    rut VARCHAR(20) UNIQUE NOT NULL,
    nombre_empresa VARCHAR(150) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE Proveedor (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_empresa VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE Bodegas (
    id_bodega SERIAL PRIMARY KEY,
    nombre_bodega VARCHAR(100) NOT NULL,
    direccion_bodega VARCHAR(255)
);

CREATE TABLE Transportista (
    id_transportista SERIAL PRIMARY KEY,
    nombre_empresa_transpo VARCHAR(150) NOT NULL,
    tipo_vehiculo VARCHAR(50)
);

CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre_empleado VARCHAR(150) NOT NULL,
    cargo VARCHAR(100),
    rut VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

CREATE TABLE Ordenes (
    id_orden SERIAL PRIMARY KEY,
    fecha_solicitud TIMESTAMP NOT NULL,
    estado VARCHAR(50) NOT NULL,
    id_cliente INT REFERENCES Clientes(id_clientes)
);

CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(150) NOT NULL,
    descripcion TEXT,
    id_categoria INT REFERENCES Categorias(id_categoria)
);

CREATE TABLE Ubicacion (
    id_ubicacion SERIAL PRIMARY KEY,
    id_bodega INT REFERENCES Bodegas(id_bodega),
    pasillo VARCHAR(50),
    estante VARCHAR(50)
);

CREATE TABLE Detalle_ordenes (
    id_orden INT REFERENCES Ordenes(id_orden),
    id_producto INT REFERENCES Productos(id_producto),
    cantidad_solicitada INT NOT NULL,
    PRIMARY KEY (id_orden, id_producto)
);


CREATE TABLE Detalle_productos (
    id_producto INT REFERENCES Productos(id_producto),
    id_proveedor INT REFERENCES Proveedor(id_proveedor),
    cantidad INT NOT NULL,
    PRIMARY KEY (id_producto, id_proveedor)
);

CREATE TABLE Inventario (
    id_producto INT REFERENCES Productos(id_producto),
    id_ubicacion INT REFERENCES Ubicacion(id_ubicacion),
    cantidad_disponible INT NOT NULL,
    PRIMARY KEY (id_producto, id_ubicacion)
);

CREATE TABLE Envios (
    id_envio SERIAL PRIMARY KEY,
    fecha_despacho TIMESTAMP,
    id_orden INT REFERENCES Ordenes(id_orden),
    id_transportista INT REFERENCES Transportista(id_transportista),
    id_empleado INT REFERENCES Empleados(id_empleado)
);
