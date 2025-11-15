
-- ============================
-- MODIFICACIONES DE TABLA TEST
-- ============================
ALTER TABLE test ADD COLUMN price FLOAT;            -- Agrega una columna llamada price de tipo flotante
ALTER TABLE test DROP COLUMN price;                 -- Elimina la columna price
ALTER TABLE test ADD COLUMN price FLOAT FIRST;      -- Agrega la columna price al inicio de la tabla
ALTER TABLE test ADD COLUMN price FLOAT AFTER name; -- Agrega la columna price después de la columna name
ALTER TABLE test MODIFY COLUMN price INT;           -- Cambia el tipo de dato de price a entero
ALTER TABLE test CHANGE price prices INT(11) DEFAULT NULL; -- Cambia el nombre de price a prices y su tipo a entero
ALTER TABLE test RENAME TO tests;                   -- Cambia el nombre de la tabla test a tests

ALTER TABLE product ADD COLUMN sku VARCHAR(100) UNIQUE AFTER product_id; -- Agrega una columna sku única después de slug