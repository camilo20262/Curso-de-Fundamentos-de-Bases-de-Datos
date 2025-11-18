-- ============================
-- INSERCIÓN DE REGISTROS
-- ============================
INSERT INTO bills (client_id, total, status) VALUES (1, 50.50, 'canceled'); -- Inserta una factura con cliente 1, total 50.50 y estado cancelado

INSERT INTO client (name, email, phone_number) VALUES ('jholman', 'c@gmail.com', '123465'); -- Inserta un cliente nuevo

INSERT INTO product(name, slug) VALUES ('Boligrafo azul','pluma Azul'); -- Inserta un producto nuevo

INSERT IGNORE INTO product(name, slug) VALUES ('Boligrafo azul','pluma Azul'); -- Intenta insertar un producto duplicado, pero lo ignora

INSERT INTO product(name, slug) VALUES ('Boligrafo azul','pluma Azul')
 On DUPLICATE KEY UPDATE description= 'actualizado por duplicidad'; -- Si el producto ya existe, actualiza su descripción

INSERT INTO product(name, slug) VALUES ('Boligrafo azul','pluma Azul')
 On DUPLICATE KEY UPDATE description= price; -- Si el producto ya existe, actualiza su descripción con el valor de la columna price 

INSERT INTO product(name, slug) VALUES ('Boligrafo azul','pluma Azul')
 On DUPLICATE KEY UPDATE description= VALUES(slug); -- Si el producto ya existe, actualiza su descripción con el valor del slug

INSERT INTO product(name, slug) VALUES ('Boligrafo azul','pluma Azul')
 On DUPLICATE KEY UPDATE description= concat('hola:', VALUES(slug)); -- Si el producto ya existe, actualiza su descripción concatenando 'hola:' con el valor del slug

INSERT INTO product(name, slug) VALUES ('Boligrafo rojo','pluma rojo'); -- Inserta otro producto nuevo

INSERT INTO product(name, slug,description) VALUES ('Boligrafo negro','pluma negro','producto negro para vender')
,('Boligrafo rosa','pluma rosa','producto rosa para vender'); -- Inserta Dos valores al tiempo


INSERT IGNORE INTO client (name, email,phone_number) VALUES('Diana Castro','camila.rojas@example.com','654132654')
,('Diana Castro','carolina.rojas@example.com','6541326548')
,('Diana Galindo','galindo.rojas@example.com','6541326348');

