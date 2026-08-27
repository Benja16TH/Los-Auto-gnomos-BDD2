SELECT
    o.id_orden,
    o.fecha_solicitud,
    o.estado,
    c.id_clientes,
    c.nombre_empresa AS cliente
FROM Ordenes o
INNER JOIN Clientes c
    ON o.id_cliente = c.id_clientes
ORDER BY o.id_orden;

SELECT
    d.id_orden,
    p.nombre_producto AS producto,
    c.nombre_categoria AS categoria,
    d.cantidad_solicitada
FROM Detalle_ordenes d
INNER JOIN Productos p
    ON d.id_producto = p.id_producto
INNER JOIN Categorias c
    ON p.id_categoria = c.id_categoria
ORDER BY d.id_orden;

SELECT
    e.id_envio,
    e.id_orden AS numero_orden,
    c.nombre_empresa AS cliente,
    t.nombre_empresa_transpo AS transportista,
    emp.nombre_empleado AS empleado_responsable,
    e.fecha_despacho
FROM Envios e
INNER JOIN Ordenes o
    ON e.id_orden = o.id_orden
INNER JOIN Clientes c
    ON o.id_cliente = c.id_clientes
INNER JOIN Transportista t
    ON e.id_transportista = t.id_transportista
INNER JOIN Empleados emp
    ON e.id_empleado = emp.id_empleado
ORDER BY e.id_envio;

SELECT
    b.nombre_bodega AS bodega,
    u.pasillo,
    u.estante,
    p.nombre_producto AS producto,
    i.cantidad_disponible AS stock
FROM Inventario i
INNER JOIN Ubicacion u
    ON i.id_ubicacion = u.id_ubicacion
INNER JOIN Bodegas b
    ON u.id_bodega = b.id_bodega
INNER JOIN Productos p
    ON i.id_producto = p.id_producto
ORDER BY b.nombre_bodega, u.pasillo, u.estante;

SELECT
    p.id_producto,
    p.nombre_producto AS producto,
    SUM(i.cantidad_disponible) AS stock_total
FROM Productos p
INNER JOIN Inventario i
    ON p.id_producto = i.id_producto
GROUP BY p.id_producto, p.nombre_producto
HAVING SUM(i.cantidad_disponible) <= 100
ORDER BY stock_total ASC;

SELECT
    b.id_bodega,
    b.nombre_bodega AS bodega,
    SUM(i.cantidad_disponible) AS cantidad_total_productos
FROM Bodegas b
INNER JOIN Ubicacion u
    ON b.id_bodega = u.id_bodega
INNER JOIN Inventario i
    ON u.id_ubicacion = i.id_ubicacion
GROUP BY b.id_bodega, b.nombre_bodega
ORDER BY b.id_bodega;

SELECT
    pr.id_proveedor,
    pr.nombre_empresa AS proveedor,
    p.id_producto,
    p.nombre_producto AS producto,
    dp.cantidad AS cantidad_asociada
FROM Detalle_productos dp
INNER JOIN Proveedor pr
    ON dp.id_proveedor = pr.id_proveedor
INNER JOIN Productos p
    ON dp.id_producto = p.id_producto
ORDER BY pr.id_proveedor, p.id_producto;
