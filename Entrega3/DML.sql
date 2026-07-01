-- \c hospital_prime no psql
USE hospital_prime;  

-- SETORES
INSERT INTO Setor (localizacao, nome) VALUES
('Térreo - Ala Leste', 'Pronto Socorro'),
('1º Andar - Ala Central', 'UTI Adulto'),
('2º Andar - Ala Sul', 'Pediatria'),
('3º Andar - Ala Norte', 'Ortopedia'),
('4º Andar - Ala Oeste', 'Cardiologia');

-- FUNCIONÁRIOS

-- Recepcionistas 
INSERT INTO Funcionario (cpf, salario, nome, Id_setor_FK) VALUES
('49382710495', 2500.00, 'Ana Paula Dias', 1),
('82736491023', 2500.00, 'Marcos Vinícius', 1),
('10928374656', 2800.00, 'Fernanda Costa', 1),
('56497631157', 2850.00, 'Gilberto Carreiras', 1),
('79885463215', 2850.00, 'Augusto Pontes', 2),
('89461333549', 3000.00, 'Robert Ferraze', 3),
('64847631269', 3150.00, 'Luana Batista', 4);

-- Enfermeiros 
INSERT INTO Funcionario (cpf, salario, nome, Id_setor_FK) VALUES
('58473629104', 5500.00, 'Roberto Almeida', 2),
('37482910485', 4200.00, 'Juliana Martins', 2),
('92837465012', 4200.00, 'Carla Mendes', 2),
('74658392019', 5500.00, 'Sérgio Ramos', 1),
('29384756102', 4200.00, 'Beatriz Souza', 1),
('10293847563', 4200.00, 'Lucas Ferreira', 3);

-- Médicos 
INSERT INTO Funcionario (cpf, salario, nome, Id_setor_FK) VALUES
('83746592011', 18000.00, 'Dr. Henrique Silva', 1),
('46573829105', 18000.00, 'Dra. Camila Rocha', 1),
('91827364509', 22000.00, 'Dr. Fernando Gomes', 2),
('38475610293', 19500.00, 'Dra. Amanda Nogueira', 3),
('57684930211', 21000.00, 'Dr. Thiago Moraes', 4),
('19283746500', 25000.00, 'Dra. Patrícia Lima', 5);

-- RECEPCIONISTA 
INSERT INTO Recepcionista (Id_funcionario, telefone, turno) VALUES
(1, '11987654321', 'Manhã'),
(2, '11976543210', 'Tarde'),
(3, '11965432109', 'Noite'),
(4, '11954321098', 'Tarde'),
(5, '11943210987', 'Manhã'),
(6, '11932109876', 'Tarde'),
(7, '11921098765', 'Noite');

-- ENFERMEIRO 
INSERT INTO Enfermeiro (Id_funcionario, coren, turno, Id_gerencia_FK) VALUES
(8,  'COREN-PR 643312', 'Manhã', NULL),
(9,  'COREN-PR 708919', 'Tarde', 8),
(10, 'COREN-PR 579606', 'Noite', 8),
(11, 'COREN-PR 700448', 'Manhã', NULL),
(12, 'COREN-PR 667980', 'Tarde', 11),
(13, 'COREN-PR 543210', 'Manhã', NULL);

-- MEDICO 
INSERT INTO Medico (Id_funcionario, crm, especialidade) VALUES
(14, 'CRM-PR 43197', 'Clínico Geral'),
(15, 'CRM-PR 48879', 'Traumatologia'),
(16, 'CRM-PR 50047', 'Intensivista'),
(17, 'CRM-PR 42189', 'Pediatria'),
(18, 'CRM-SP 11104', 'Ortopedia'),
(19, 'CRM-SP 11105', 'Cardiologia');

-- PACIENTES
INSERT INTO Paciente (nome, idade) VALUES
('Renato dos Santos', 50),
('Jeferson Alves', 12),
('Julia Moreira da Silva', 34),
('Denis Augusto dos Anjos', 43),
('Carlos Miguel Dutra', 10),
('Jasmin Ferreira', 21),
('Tayse Aguiar', 38),
('Kleber Ramos', 20),
('Isadora Lima Naves', 16),
('Jose Ricardo Perez', 73),
('John Assis', 40),
('Felipe Nogueira Alves', 22),
('Maria Barbosa', 28),
('Kauan Rodrigues da Costa', 43),
('Denise Oliveira', 41);

-- TRIAGEM
INSERT INTO Triagem (prioridade, sintomas, Id_paciente_FK) VALUES
('Alta', 'Dor torácica forte, sudorese e formigamento no braço esquerdo', 1), 
('Média', 'Tosse persistente, febre de 38.5 e prostração', 2),               
('Alta', 'Fratura exposta na tíbia após queda', 3),                          
('Baixa', 'Dor leve no tornozelo após partida de futebol', 4),               
('Média', 'Criança chorando muito, febre de 39 graus e vômito', 5),          
('Alta', 'Insuficiência respiratória aguda e baixa saturação (85%)', 6),     
('Baixa', 'Renovação de receita para hipertensão', 7),                       
('Média', 'Dores fortes na lombar irradiando para a perna', 8),              
('Alta', 'Paciente com convulsão febril', 9),                                
('Alta', 'Pico de pressão alta 200x120 e visão embaçada', 10),               
('Média', 'Suspeita de pneumonia, cansaço extremo', 11),                     
('Alta', 'Dor abdominal aguda, suspeita de apendicite', 12),                 
('Baixa', 'Acompanhamento de rotina cardiológica', 13),                      
('Média', 'Luxação no ombro direito', 14),                                   
('Baixa', 'Alergia cutânea após ingestão de crustáceos', 15);                

-- AGENDAMENTOS 
INSERT INTO Agendamento (data, horario, status, Id_funcionario_FK) VALUES
('2026-06-28', '08:00:00', 'Emergência', 19),  
('2026-06-28', '08:30:00', 'Confirmado', 14),
('2026-06-28', '09:00:00', 'Emergência', 15),  
('2026-06-28', '09:30:00', 'Confirmado', 18),  
('2026-06-28', '10:00:00', 'Emergência', 17),  
('2026-06-28', '10:30:00', 'Emergência', 16),  
('2026-06-28', '11:00:00', 'Finalizado', 14),   
('2026-06-28', '11:30:00', 'Confirmado', 18),  
('2026-06-28', '13:00:00', 'Emergência', 17),  
('2026-06-28', '13:30:00', 'Emergência', 19),  
('2026-06-28', '14:00:00', 'Confirmado', 14),   
('2026-06-28', '14:30:00', 'Emergência', 15),  
('2026-06-28', '15:00:00', 'Confirmado', 19),  
('2026-06-28', '15:30:00', 'Confirmado', 18),  
('2026-06-28', '16:00:00', 'Finalizado', 14);   

-- CONSULTAS 
INSERT INTO Consulta (horario, data, Id_triagem_FK, Id_funcionario_FK, Id_agendamento_FK) VALUES
('08:00:00', '2026-06-28', 1, 19, 1),
('08:30:00', '2026-06-28', 2, 14, 2),
('09:00:00', '2026-06-28', 3, 15, 3),
('09:30:00', '2026-06-28', 4, 18, 4),
('10:00:00', '2026-06-28', 5, 17, 5),
('10:30:00', '2026-06-28', 6, 16, 6),
('11:00:00', '2026-06-28', 7, 14, 7),
('11:30:00', '2026-06-28', 8, 18, 8),
('13:00:00', '2026-06-28', 9, 17, 9),
('13:30:00', '2026-06-28', 10, 19, 10),
('14:00:00', '2026-06-28', 11, 14, 11),
('14:30:00', '2026-06-28', 12, 15, 12),
('15:00:00', '2026-06-28', 13, 19, 13),
('15:30:00', '2026-06-28', 14, 18, 14),
('16:00:00', '2026-06-28', 15, 14, 15);