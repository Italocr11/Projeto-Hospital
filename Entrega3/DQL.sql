USE sistema_compras;

SELECT id_cliente, nome, email 
FROM cliente 
WHERE id_cliente IN (
    SELECT id_cliente 
    FROM compra 
    WHERE valor_total > (SELECT AVG(valor_total) FROM compra)
);

SELECT c.id_cliente, c.nome, c.email 
FROM cliente c 
WHERE EXISTS (
    SELECT 1 
    FROM compra co
    JOIN item_compra ic ON co.id_compra = ic.id_compra
    WHERE co.id_cliente = c.id_cliente 
      AND ic.nome_produto = 'Notebook Dell Inspiron'
);

SELECT c.nome,
       (SELECT MAX(co.data_compra) 
        FROM compra co 
        WHERE co.id_cliente = c.id_cliente) AS data_ultima_compra
FROM cliente c;

SELECT id_compra, data_compra, valor_total 
FROM compra 
WHERE valor_total = (SELECT MAX(valor_total) FROM compra);

SELECT nome, email AS contato, 'Cliente' AS perfil 
FROM cliente
UNION
SELECT nome, CONCAT('Matrícula: ', matricula) AS contato, 'Vendedor' AS perfil 
FROM vendedor;

SELECT nome AS nome_destaque, 'Cliente VIP' AS motivo_destaque 
FROM cliente 
WHERE id_cliente IN (SELECT id_cliente FROM compra WHERE valor_total > 2000.00)
UNION
SELECT nome AS nome_destaque, 'Vendedor Alta Performance' AS motivo_destaque 
FROM vendedor 
WHERE percentual_comissao >= 3.00;