USE sistema_hospitalar;

SELECT nome, idade 
FROM paciente 
WHERE id_paciente IN (
    SELECT id_paciente_fk 
    FROM triagem 
    WHERE prioridade = 'Emergência'
);

SELECT f.nome, m.crm, m.especialidade 
FROM funcionario f
JOIN medico m ON f.id_funcionario = m.id_funcionario
WHERE EXISTS (
    SELECT 1 
    FROM consulta c 
    WHERE c.id_funcionario_fk = m.id_funcionario
);

SELECT nome, salario 
FROM funcionario 
WHERE salario > (SELECT AVG(salario) FROM funcionario);

SELECT p.nome,
       (SELECT COUNT(*) 
        FROM triagem t 
        WHERE t.id_paciente_fk = p.id_paciente) AS total_atendimentos_triagem
FROM paciente p;

SELECT nome, 'Paciente' AS papel_no_hospital FROM paciente
UNION
SELECT nome, 'Funcionário/Médico' AS papel_no_hospital FROM funcionario;

SELECT nome, 'Critério: Idoso (Grupo de Risco)' AS motivo_prioridade 
FROM paciente 
WHERE idade > 60
UNION
SELECT p.nome, 'Critério: Triagem de Alta Prioridade' AS motivo_prioridade 
FROM paciente p
WHERE p.id_paciente IN (SELECT id_paciente_fk FROM triagem WHERE prioridade = 'Alta');