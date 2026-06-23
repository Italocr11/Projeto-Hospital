USE sistema_compras;


-- PARA O PROFESSOR: Foi gerado nomes utilizando a IA para facilitar o processo. #énois
INSERT INTO cliente (nome, email, telefone) VALUES
('João da Silva', 'joao.silva@email.com', '(11) 98765-4321'),
('Maria Oliveira', 'maria.oliveira@email.com', '(21) 99888-7766'),
('Carlos Santos', 'carlos.santos@email.com', '(31) 99123-4567'),
('Ana Costa', 'ana.costa@email.com', '(41) 98111-2233'),
('Pedro Souza', 'pedro.souza@email.com', '(51) 97000-1122'),
('Juliana Lima', 'juliana.lima@email.com', '(61) 96333-4455'),
('Lucas Pereira', 'lucas.pereira@email.com', '(71) 95555-6677'),
('Beatriz Rodrigues', 'beatriz.r@email.com', '(81) 94444-5566'),
('Fernando Almeida', 'fernando.a@email.com', '(85) 93333-2211'),
('Camila Ribeiro', 'camila.ribeiro@email.com', '(92) 92222-3344');

INSERT INTO vendedor (nome, matricula, percentual_comissao) VALUES
('Roberto Mendes', 'MAT-001', 2.50),
('Fernanda Rocha', 'MAT-002', 3.00),
('Ricardo Alves', 'MAT-003', 1.50),
('Patrícia Gomes', 'MAT-004', 2.00),
('Marcelo Vieira', 'MAT-005', 4.00),
('Amanda Martins', 'MAT-006', 2.50),
('Thiago Barbosa', 'MAT-007', 3.50),
('Camila Ramos', 'MAT-008', 1.80),
('Bruno Teixeira', 'MAT-009', 2.20),
('Letícia Castro', 'MAT-010', 3.00);

INSERT INTO compra (id_cliente, id_vendedor, data_compra, valor_total) VALUES
(1, 1, '2026-01-10', 1500.00),
(2, 2, '2026-01-12', 850.00),
(3, 3, '2026-01-15', 120.00),
(4, 4, '2026-01-18', 2300.00),
(5, 5, '2026-01-20', 450.00),
(6, 6, '2026-02-02', 3200.00),
(7, 7, '2026-02-05', 99.90),
(8, 8, '2026-02-10', 600.00),
(9, 9, '2026-02-14', 1250.00),
(10, 10, '2026-02-20', 180.00);

INSERT INTO item_compra (id_compra, id_item, nome_produto, quantity, preco_unitario) VALUES
(1, 1, 'Notebook Dell Inspiron', 1, 1500.00),
(2, 1, 'Smartphone Samsung Galaxy', 1, 850.00),
(3, 1, 'Teclado Mecânico RGB', 1, 120.00),
(4, 1, 'Smart TV 4K 50"', 1, 2300.00),
(5, 1, 'Monitor Full HD 24"', 1, 450.00),
(6, 1, 'Console PlayStation 5', 1, 3200.00),
(7, 1, 'Mouse Gamer Sem Fio', 1, 99.90),
(8, 1, 'Cadeira Ergonômica de Escritório', 1, 600.00),
(9, 1, 'Ar Condicionado Split 9000 BTUs', 1, 1250.00),
(10, 1, 'Fone de Ouvido Bluetooth JBL', 1, 180.00);