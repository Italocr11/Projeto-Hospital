CREATE DATABASE IF NOT EXISTS sistema_hospitalar;
USE sistema_hospitalar;

CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    CONSTRAINT pk_paciente PRIMARY KEY (id_paciente),
    CONSTRAINT chk_paciente_idade CHECK (idade >= 0)
);

CREATE TABLE funcionario (
    id_funcionario INT AUTO_INCREMENT,
    cpf VARCHAR(14) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    CONSTRAINT pk_funcionario PRIMARY KEY (id_funcionario),
    CONSTRAINT uq_funcionario_cpf UNIQUE (cpf),
    CONSTRAINT chk_funcionario_salario CHECK (salario > 0)
);

CREATE TABLE medico (
    id_funcionario INT,
    crm VARCHAR(20) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    CONSTRAINT pk_medico PRIMARY KEY (id_funcionario),
    CONSTRAINT uq_medico_crm UNIQUE (crm),
    CONSTRAINT fk_medico_funcionario FOREIGN KEY (id_funcionario) 
        REFERENCES funcionario(id_funcionario) ON DELETE CASCADE
);

CREATE TABLE triagem (
    id_triagem INT AUTO_INCREMENT,
    prioridade VARCHAR(30) NOT NULL,
    sintomas TEXT NOT NULL,
    id_paciente_fk INT NOT NULL,
    CONSTRAINT pk_triagem PRIMARY KEY (id_triagem),
    CONSTRAINT fk_triagem_paciente FOREIGN KEY (id_paciente_fk) 
        REFERENCES paciente(id_paciente),
    CONSTRAINT chk_triagem_prioridade CHECK (prioridade IN ('Baixa', 'Média', 'Alta', 'Emergência'))
);

CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT,
    horario TIME NOT NULL,
    data_consulta DATE NOT NULL,
    id_triagem_fk INT NOT NULL,
    id_funcionario_fk INT NOT NULL,
    CONSTRAINT pk_consulta PRIMARY KEY (id_consulta),
    CONSTRAINT fk_consulta_triagem FOREIGN KEY (id_triagem_fk) 
        REFERENCES triagem(id_triagem),
    CONSTRAINT fk_consulta_medico FOREIGN KEY (id_funcionario_fk) 
        REFERENCES medico(id_funcionario),
    CONSTRAINT uq_consulta_triagem UNIQUE (id_triagem_fk)
);