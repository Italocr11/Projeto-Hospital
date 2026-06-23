CREATE DATABASE IF NOT EXISTS sys_hosp;
USE sys_hosp;

-- SETOR
CREATE TABLE Setor (
    Id_setor    SERIAL       PRIMARY KEY,
    localizacao VARCHAR(100) NOT NULL,
    nome        VARCHAR(100) NOT NULL UNIQUE
);

-- QUARTO
CREATE TABLE Quarto (
    Id_quarto   SERIAL      PRIMARY KEY,
    numero      INT         NOT NULL,
    tipo        VARCHAR(50) NOT NULL,
    capacidade  INT         NOT NULL CHECK (capacidade > 0),
    Id_setor_FK INT         NOT NULL,

    FOREIGN KEY (Id_setor_FK) REFERENCES Setor(Id_setor)
);

-- LEITO
CREATE TABLE Leito (
    Id_leito     SERIAL      PRIMARY KEY,
    numero       INT         NOT NULL,
    tipo         VARCHAR(50) NOT NULL,
    status       VARCHAR(20) NOT NULL
                     CHECK (status IN ('Disponivel', 'Ocupado', 'Manutencao')),
    Id_quarto_FK INT         NOT NULL,

    FOREIGN KEY (Id_quarto_FK) REFERENCES Quarto(Id_quarto)
);

-- PACIENTE
CREATE TABLE Paciente (
    Id_paciente SERIAL       PRIMARY KEY,
    nome        VARCHAR(150) NOT NULL,
    idade       INT          NOT NULL CHECK (idade >= 0)
);

-- RESPONSAVEL
CREATE TABLE Responsavel (
    Id_responsavel SERIAL       PRIMARY KEY,
    nome           VARCHAR(150) NOT NULL,
    parentesco     VARCHAR(50)  NOT NULL,
    telefone       VARCHAR(20)
);

-- ALERGIA
CREATE TABLE Alergia (
    Id_alergia SERIAL       PRIMARY KEY,
    descricao  VARCHAR(200) NOT NULL,
    gravidade  VARCHAR(20)
                   CHECK (gravidade IN ('Leve', 'Moderada', 'Grave'))
);

-- CONVENIO
CREATE TABLE Convenio (
    Id_convenio SERIAL       PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    cobertura   TEXT,
    validade    DATE         NOT NULL
);

-- FUNCIONARIO 
CREATE TABLE Funcionario (
    Id_funcionario SERIAL         PRIMARY KEY,
    cpf            CHAR(11)       NOT NULL UNIQUE,
    salario        NUMERIC(10, 2) NOT NULL CHECK (salario >= 0),
    nome           VARCHAR(150)   NOT NULL,
    Id_setor_FK    INT            NOT NULL,

    FOREIGN KEY (Id_setor_FK) REFERENCES Setor(Id_setor)
);

-- RECEPCIONISTA 
CREATE TABLE Recepcionista (
    Id_funcionario INT         PRIMARY KEY,
    telefone       VARCHAR(20),
    turno          VARCHAR(20) NOT NULL,

    FOREIGN KEY (Id_funcionario) REFERENCES Funcionario(Id_funcionario)
);

-- ENFERMEIRO (especialização de Funcionario)
CREATE TABLE Enfermeiro (
    Id_funcionario INT         PRIMARY KEY,
    coren          VARCHAR(30) NOT NULL UNIQUE,
    turno          VARCHAR(20) NOT NULL,
    Id_gerencia_FK INT,

    FOREIGN KEY (Id_funcionario) REFERENCES Funcionario(Id_funcionario),
    FOREIGN KEY (Id_gerencia_FK) REFERENCES Enfermeiro(Id_funcionario)
);

-- MEDICO (especialização de Funcionario)
CREATE TABLE Medico (
    Id_funcionario INT          PRIMARY KEY,
    crm            VARCHAR(30)  NOT NULL UNIQUE,
    especialidade  VARCHAR(100) NOT NULL,

    FOREIGN KEY (Id_funcionario) REFERENCES Funcionario(Id_funcionario)
);

-- MEDICAMENTO
CREATE TABLE Medicamento (
    Id_medicamento SERIAL       PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    fabricante     VARCHAR(100),
    tipo           VARCHAR(50),
    substancias    TEXT
);

-- MEDICAMENTO_ALERGIA
CREATE TABLE Medicamento_alergia (
    Id_medicamento_FK INT NOT NULL,
    Id_alergia_FK     INT NOT NULL,

    PRIMARY KEY (Id_medicamento_FK, Id_alergia_FK),

    FOREIGN KEY (Id_medicamento_FK) REFERENCES Medicamento(Id_medicamento),
    FOREIGN KEY (Id_alergia_FK)     REFERENCES Alergia(Id_alergia)
);

-- PLANTAO
CREATE TABLE Plantao (
    Id_plantao SERIAL        PRIMARY KEY,
    data       DATE          NOT NULL,
    turno      VARCHAR(20)   NOT NULL,
    escala     VARCHAR(100)  NOT NULL
);

-- AGENDAMENTO
CREATE TABLE Agendamento (
    Id_agendamento    SERIAL      PRIMARY KEY,
    data              DATE        NOT NULL,
    horario           TIME        NOT NULL,
    status            VARCHAR(30) NOT NULL,
    Id_funcionario_FK INT         NOT NULL,

    FOREIGN KEY (Id_funcionario_FK) REFERENCES Medico(Id_funcionario),

    UNIQUE (Id_funcionario_FK, data, horario)
);

-- TRIAGEM
CREATE TABLE Triagem (
    Id_triagem     SERIAL      PRIMARY KEY,
    prioridade     VARCHAR(20) NOT NULL,
    sintomas       TEXT        NOT NULL,
    Id_paciente_FK INT         NOT NULL,

    FOREIGN KEY (Id_paciente_FK) REFERENCES Paciente(Id_paciente)
);

-- CONSULTA
CREATE TABLE Consulta (
    Id_consulta       SERIAL PRIMARY KEY,
    horario           TIME   NOT NULL,
    data              DATE   NOT NULL,
    Id_triagem_FK     INT    NOT NULL,
    Id_funcionario_FK INT    NOT NULL,
    Id_agendamento_FK INT    NOT NULL UNIQUE,        -- 1:1 com Agendamento

    FOREIGN KEY (Id_triagem_FK)     REFERENCES Triagem(Id_triagem),
    FOREIGN KEY (Id_funcionario_FK) REFERENCES Medico(Id_funcionario),
    FOREIGN KEY (Id_agendamento_FK) REFERENCES Agendamento(Id_agendamento),

    UNIQUE (Id_funcionario_FK, data, horario)
);

-- INTERNACAO
CREATE TABLE Internacao (
    Id_internacao  SERIAL      PRIMARY KEY,
    data_entrada   DATE        NOT NULL,
    data_saida     DATE,
    motivo         TEXT        NOT NULL,
    status         VARCHAR(20) NOT NULL DEFAULT 'Ativa'
                       CHECK (status IN ('Ativa', 'Alta')),
    Id_paciente_FK INT         NOT NULL,
    Id_leito_FK    INT         NOT NULL,

    FOREIGN KEY (Id_paciente_FK) REFERENCES Paciente(Id_paciente),
    FOREIGN KEY (Id_leito_FK)    REFERENCES Leito(Id_leito)
);

CREATE TABLE Internacao_medico (
    Id_internacao_FK  INT NOT NULL,
    Id_funcionario_FK INT NOT NULL,

    PRIMARY KEY (Id_internacao_FK, Id_funcionario_FK),

    FOREIGN KEY (Id_internacao_FK)  REFERENCES Internacao(Id_internacao),
    FOREIGN KEY (Id_funcionario_FK) REFERENCES Medico(Id_funcionario)
);

-- EXAME
CREATE TABLE Exame (
    Id_exame       SERIAL       PRIMARY KEY,
    tipo           VARCHAR(100) NOT NULL,
    status         VARCHAR(30)  NOT NULL,
    dados          TEXT,
    Id_consulta_FK INT          NOT NULL,

    FOREIGN KEY (Id_consulta_FK) REFERENCES Consulta(Id_consulta)
);

-- RESULTADO_EXAME
CREATE TABLE Resultado_exame (
    Id_resultado   SERIAL PRIMARY KEY,
    data_resultado DATE   NOT NULL,
    descricao      TEXT   NOT NULL,
    Id_exame_FK    INT    NOT NULL UNIQUE,

    FOREIGN KEY (Id_exame_FK) REFERENCES Exame(Id_exame)
);

-- PRESCRICAO
CREATE TABLE Prescricao (
    Id_prescricao  SERIAL PRIMARY KEY,
    data           DATE   NOT NULL,
    descricao      TEXT   NOT NULL,
    Id_consulta_FK INT    NOT NULL,

    FOREIGN KEY (Id_consulta_FK) REFERENCES Consulta(Id_consulta)
);

-- ITEM_PRESCRICAO
CREATE TABLE Item_Prescricao (
    Id_item           SERIAL      PRIMARY KEY,
    dosagem           VARCHAR(50) NOT NULL,
    frequencia        VARCHAR(50) NOT NULL,
    duracao           VARCHAR(50) NOT NULL,
    Id_prescricao_FK  INT         NOT NULL,
    Id_medicamento_FK INT         NOT NULL,

    FOREIGN KEY (Id_prescricao_FK)  REFERENCES Prescricao(Id_prescricao),
    FOREIGN KEY (Id_medicamento_FK) REFERENCES Medicamento(Id_medicamento)
);

-- Paciente <-> Alergia
CREATE TABLE Paciente_alergia (
    Id_alergia_FK  INT NOT NULL,
    Id_paciente_FK INT NOT NULL,

    PRIMARY KEY (Id_alergia_FK, Id_paciente_FK),

    FOREIGN KEY (Id_alergia_FK)  REFERENCES Alergia(Id_alergia),
    FOREIGN KEY (Id_paciente_FK) REFERENCES Paciente(Id_paciente)
);

-- Paciente <-> Convenio
CREATE TABLE Convenio_paciente (
    Id_convenio_FK INT NOT NULL,
    Id_paciente_FK INT NOT NULL,

    PRIMARY KEY (Id_convenio_FK, Id_paciente_FK),

    FOREIGN KEY (Id_convenio_FK) REFERENCES Convenio(Id_convenio),
    FOREIGN KEY (Id_paciente_FK) REFERENCES Paciente(Id_paciente)
);

-- Paciente <-> Responsavel
CREATE TABLE Paciente_responsavel (
    Id_responsavel_FK INT NOT NULL,
    Id_paciente_FK    INT NOT NULL,

    PRIMARY KEY (Id_responsavel_FK, Id_paciente_FK),

    FOREIGN KEY (Id_responsavel_FK) REFERENCES Responsavel(Id_responsavel),
    FOREIGN KEY (Id_paciente_FK)    REFERENCES Paciente(Id_paciente)
);

-- Medico <-> Plantao
CREATE TABLE Plantao_medico (
    Id_funcionario_FK    INT NOT NULL,
    Id_plantao_medico_FK INT NOT NULL,

    PRIMARY KEY (Id_funcionario_FK, Id_plantao_medico_FK),

    FOREIGN KEY (Id_funcionario_FK)    REFERENCES Medico(Id_funcionario),
    FOREIGN KEY (Id_plantao_medico_FK) REFERENCES Plantao(Id_plantao)
);

-- Enfermeiro <-> Plantao
CREATE TABLE Plantao_enfermeiro (
    Id_funcionario_FK        INT NOT NULL,
    Id_plantao_enfermeiro_FK INT NOT NULL,

    PRIMARY KEY (Id_funcionario_FK, Id_plantao_enfermeiro_FK),

    FOREIGN KEY (Id_funcionario_FK)        REFERENCES Enfermeiro(Id_funcionario),
    FOREIGN KEY (Id_plantao_enfermeiro_FK) REFERENCES Plantao(Id_plantao)
);

-- Setor <-> Plantao
CREATE TABLE Setor_plantao (
    Id_setor_FK   INT NOT NULL,
    Id_plantao_FK INT NOT NULL,

    PRIMARY KEY (Id_setor_FK, Id_plantao_FK),

    FOREIGN KEY (Id_setor_FK)   REFERENCES Setor(Id_setor),
    FOREIGN KEY (Id_plantao_FK) REFERENCES Plantao(Id_plantao)
);
