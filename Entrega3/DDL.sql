CREATE DATABASE IF NOT EXISTS sistema_compras;
USE sistema_compras;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_email UNIQUE (email)
);

CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    percentual_comissao DECIMAL(4,2) DEFAULT 0.00,
    CONSTRAINT pk_vendedor PRIMARY KEY (id_vendedor),
    CONSTRAINT uq_vendedor_matricula UNIQUE (matricula),
    CONSTRAINT chk_comissao CHECK (percentual_comissao >= 0.00)
);

CREATE TABLE compra (
    id_compra INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_vendedor INT NOT NULL,
    data_compra DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT pk_compra PRIMARY KEY (id_compra),
    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_compra_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    CONSTRAINT chk_valor_total CHECK (valor_total >= 0.00)
);

CREATE TABLE item_compra (
    id_compra INT NOT NULL,
    id_item INT NOT NULL,
    nome_produto VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_item_compra PRIMARY KEY (id_compra, id_item),
    CONSTRAINT fk_item_compra_compra FOREIGN KEY (id_compra) REFERENCES compra(id_compra) ON DELETE CASCADE,
    CONSTRAINT chk_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_preco_unitario CHECK (preco_unitario > 0.00)
);