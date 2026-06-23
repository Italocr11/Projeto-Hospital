USE sistema_hospitalar;

-- foi usada a IA para gerar nomes mais rápido
INSERT INTO paciente (nome, idade) VALUES
('João da Silva', 45),
('Maria Oliveira', 29),
('Carlos Souza', 68),
('Ana Costa', 12),
('Pedro Santos', 34),
('Juliana Lima', 51),
('Lucas Almeida', 23),
('Beatriz Ribeiro', 77),
('Fernando Mendes', 41),
('Camila Rocha', 3Sales);

INSERT INTO funcionario (cpf, salario, nome) VALUES
('111.222.333-44', 12000.00, 'Dr. Arnaldo Castilho'),
('222.333.444-55', 14500.00, 'Dra. Beatriz Nogueira'),
('333.444.555-66', 11000.00, 'Dr. Caio Prado'),
('444.555.666-77', 16000.00, 'Dra. Daniela Freitas'),
('555.666.777-88', 13000.00, 'Dr. Eduardo Gomes'),
('666.777.888-99', 12500.00, 'Dra. Fernanda Malta'),
('777.888.999-00', 15000.00, 'Dr. Gustavo Borges'),
('888.999.000-11', 11500.00, 'Dra. Helena Reis'),
('999.000.111-22', 17000.00, 'Dr. Igor Silveira'),
('000.111.222-33', 13500.00, 'Dra. Júlia Paiva');

INSERT INTO medico (id_funcionario, crm, especialidade) VALUES
(1, 'CRM/PR 12345', 'Clínica Geral'),
(2, 'CRM/PR 23456', 'Pediatria'),
(3, 'CRM/PR 34567', 'Cardiologia'),
(4, 'CRM/PR 45678', 'Neurologia'),
(5, 'CRM/PR 56789', 'Ortopedia'),
(6, 'CRM/PR 67890', 'Ginecologia'),
(7, 'CRM/PR 78901', 'Dermatologia'),
(8, 'CRM/PR 89012', 'Oftalmologia'),
(9, 'CRM/PR 90123', 'Psiquiatria'),
(10, 'CRM/PR 01234', 'Otorrinolaringologia');

INSERT INTO triagem (prioridade, sintomas, id_paciente_fk) VALUES
('Emergência', 'Dor aguda no peito irradiando para o braço esquerdo', 1),
('Baixa', 'Coriza, febre leve e dor de garganta há dois dias', 2),
('Alta', 'Falta de ar progressiva e saturação de oxigênio em 91%', 3),
('Média', 'Febre alta persistente (39°C) e vômitos recorrentes', 4),
('Alta', 'Suspeita de fratura fechada no tornozelo após queda', 5),
('Baixa', 'Renovação de receita médica de uso contínuo', 6),
('Média', 'Crise de enxaqueca severa acompanhada de fotofobia', 7),
('Emergência', 'Perda súbita de força no lado direito do corpo e fala arrastada', 8),
('Média', 'Crise de ansiedade severa com palpitações cardíacas', 9),
('Baixa', 'Dor de ouvido leve sem secreção ou febre', 10);

INSERT INTO consulta (horario, data_consulta, id_triagem_fk, id_funcionario_fk) VALUES
('08:30:00', '2026-06-01', 1, 3), -- Cardiologista
('09:15:00', '2026-06-01', 2, 1), -- Clínico Geral
('10:00:00', '2026-06-01', 3, 1), -- Clínico Geral
('11:00:00', '2026-06-02', 4, 2), -- Pediatra
('13:30:00', '2026-06-02', 5, 5), -- Ortopedista
('14:15:00', '2026-06-02', 6, 1), -- Clínico Geral
('15:00:00', '2026-06-03', 7, 4), -- Neurologista
('16:00:00', '2026-06-03', 8, 4), -- Neurologia (Suspeita AVC)
('16:45:00', '2026-06-03', 9, 9), -- Psiquiatra
('17:30:00', '2026-06-04', 10, 10);-- Otorrino