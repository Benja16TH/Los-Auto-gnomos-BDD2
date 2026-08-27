INSERT INTO Clientes (rut, nombre_empresa, direccion, telefono, correo)
VALUES ('20.129.104-6', 'NEKKHRIS SPA', 'Av. Pedro de Valdivia 425',
'+56983139665', 'benjamin.juanillo@cloud.uautonoma.cl');

INSERT INTO Productos (nombre_producto, descripcion, id_categoria)
VALUES ('Samsung Galaxy Tab S7+', 'Tablet', 1);

UPDATE Inventario
SET cantidad_disponible=10
WHERE id_ubicacion=1;

UPDATE Proveedor
SET nombre_empresa='Autógnomos', telefono='+56930566665', correo='autognomos_spa@yopmail.com'
WHERE id_proveedor=1;

INSERT INTO Productos (nombre_producto, descripcion, id_categoria)
VALUES ('Ryzen 5 5500', 'Procesador', 1);

DELETE FROM Productos WHERE nombre_producto='Ryzen 5 5500';

SELECT * FROM Clientes WHERE rut='20.129.104-6';

SELECT * FROM Productos WHERE descripcion='Tablet';

SELECT * FROM Inventario WHERE id_ubicacion=1;

SELECT * FROM Proveedor WHERE id_proveedor=1;
