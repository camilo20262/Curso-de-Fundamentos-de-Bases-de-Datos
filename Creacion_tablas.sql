-- =========================
-- CREACIÓN DE TABLA CLIENT
-- =========================
CREATE TABLE IF NOT EXISTS client (                 -- Crea la tabla client solo si no existe
  client_id INT PRIMARY KEY AUTO_INCREMENT,         -- Identificador único del cliente, autoincremental
  name VARCHAR(100) NOT NULL,                       -- Nombre del cliente, obligatorio
  email VARCHAR(60) NOT NULL UNIQUE,                -- Correo electrónico, obligatorio y único
  phone_number VARCHAR(15) NOT NULL,                -- Número de teléfono, obligatorio
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Fecha de creación automática
  modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Fecha de modificación automática
);

-- =========================
-- CREACIÓN DE TABLA PRODUCT
-- =========================
CREATE TABLE IF NOT EXISTS product(                 -- Crea la tabla product solo si no existe
  product_id INT PRIMARY KEY AUTO_INCREMENT,        -- Identificador único del producto
  name VARCHAR(100) NOT NULL,                       -- Nombre del producto, obligatorio
  slug VARCHAR(200) NOT NULL UNIQUE,                -- Identificador de texto único (para URLs)
  description TEXT,                                 -- Descripción del producto
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Fecha de creación automática
  modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Fecha de modificación automática
);

-- =======================
-- CREACIÓN DE TABLA BILLS
-- =======================
CREATE TABLE IF NOT EXISTS bills(                   -- Crea la tabla bills (facturas)
  bill_id INT PRIMARY KEY AUTO_INCREMENT,           -- Identificador único de la factura
  client_id INT NOT NULL,                           -- ID del cliente que generó la factura
  total FLOAT,                                      -- Valor total de la factura
  status ENUM('pending', 'paid', 'canceled') NOT NULL DEFAULT 'pending', -- Estado de la factura
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Fecha de creación
  modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Última modificación
  FOREIGN KEY (client_id) REFERENCES client(client_id)       -- Relación con la tabla client
  ON DELETE CASCADE                                       -- Si se borra un cliente, se borran sus facturas
  ON UPDATE CASCADE                                       -- Si se actualiza el ID del cliente, se actualiza aquí también
);

-- ==============================
-- CREACIÓN DE TABLA BILL_PRODUCT
-- ==============================
CREATE TABLE bill_product(                          -- Tabla intermedia entre bills y product
  bill_product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  -- Identificador único del registro
  quantity INT NOT NULL,                            -- Cantidad del producto en la factura
  bill_id INT NOT NULL,                             -- Referencia a la factura
  product_id INT NOT NULL,                          -- Referencia al producto
  FOREIGN KEY (bill_id) REFERENCES bills(bill_id),  -- Clave foránea hacia bills
  FOREIGN KEY (product_id) REFERENCES product(product_id) -- Clave foránea hacia product
);

-- ===================
-- CREACIÓN DE TABLA TEST
-- ===================
CREATE TABLE test (                                 -- Crea una tabla de prueba llamada test
  teste_id INT PRIMARY KEY AUTO_INCREMENT,          -- ID único autoincremental
  name VARCHAR(100) NOT NULL,                       -- Nombre del registro
  qty INT,                                          -- Cantidad (puede ser nula)
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,   -- Fecha de creación
  modified_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Última modificación
);