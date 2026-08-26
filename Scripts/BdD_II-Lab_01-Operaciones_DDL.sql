CREATE TABLE auditoria_inventario();

ALTER TABLE auditoria_inventario ADD COLUMN id_auditoria_inventario SERIAL NOT NULL;

ALTER TABLE auditoria_inventario DROP COLUMN id_auditoria_inventario;

DROP TABLE auditoria_inventario;