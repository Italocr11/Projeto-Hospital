-- \c hospital_prime -- Postgres
USE hospital_prime; -- MySQL

-- 1) Pacientes com triagem de prioridade ALTA 
SELECT nome, idade
FROM paciente
WHERE id_paciente IN (
    SELECT id_paciente_fk
    FROM triagem
    WHERE prioridade = 'Alta'
);

-- 2) Médicos que já realizaram pelo menos uma consulta
SELECT f.nome, m.crm, m.especialidade
FROM funcionario f
JOIN medico m ON f.id_funcionario = m.id_funcionario
WHERE EXISTS (
    SELECT c.id_consulta
    FROM consulta c
    WHERE c.id_funcionario_fk = m.id_funcionario
);

-- 3) Funcionários com salário acima da média geral  
SELECT nome, salario
FROM funcionario
WHERE salario > (
    SELECT AVG(salario) FROM funcionario
);

-- 4) Total de triagens por paciente 
SELECT p.nome,
       (SELECT COUNT(*)
        FROM triagem t
        WHERE t.id_paciente_fk = p.id_paciente) AS total_atendimentos_triagem
FROM paciente p;

-- 5) Lista unificada de pessoas no hospital, com seu papel 
SELECT nome, 'Paciente' AS papel_no_hospital FROM paciente
UNION
SELECT nome, 'Funcionário/Médico' AS papel_no_hospital FROM funcionario;

-- 6) Pacientes prioritários por idade OU por triagem de alta prioridade.
SELECT nome, 'Critério: Idoso (Grupo de Risco)' AS motivo_prioridade
FROM paciente
WHERE idade > 60
UNION
SELECT p.nome, 'Critério: Triagem de Alta Prioridade' AS motivo_prioridade
FROM paciente p
WHERE p.id_paciente IN (SELECT id_paciente_fk FROM triagem WHERE prioridade = 'Alta');