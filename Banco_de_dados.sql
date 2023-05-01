CREATE TABLE endereco(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(150) NOT NULL,
    bairro VARCHAR(120) NOT NULL,
    complemento VARCHAR(200),
    numero INT NOT NULL,
    UF VARCHAR(3) NOT NULL,
    nome_cidade VARCHAR(150) NOT NULL,
    CEP INT NOT NULL
);
CREATE TABLE pessoa (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    matricula VARCHAR(12) NOT NULL,
    nome VARCHAR(40) NOT NULL,
    cargo VARCHAR(40) NOT NULL,
    data_nascimento TIMESTAMP NOT NULL,
    data_matricula TIMESTAMP NOT NULL,
    carga_horaria INT NOT NULL,
    email VARCHAR(200) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    id_endereco INT NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);
CREATE TABLE afastamento (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_inicial TIMESTAMP NOT NULL,
    data_final TIMESTAMP NOT NULL,
    descricao VARCHAR(240),
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE atestado(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    motivo VARCHAR(250) NOT NULL,
    data_inicial TIMESTAMP NOT NULL,
    data_final TIMESTAMP NOT NULL,
    observacoes VARCHAR(250) NOT NULL,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE assiduidade (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data TIMESTAMP NOT NULL,
    assiduidade NUMBER(1, 0) NOT NULL,
    id_pessoa INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE modalidade (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(125) NOT NULL,
    observacao VARCHAR(250)
);
CREATE TABLE reuniao (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_modalidade INT NOT NULL,
    data_reuniao TIMESTAMP NOT NULL,
    tipo VARCHAR(150) NOT NULL,
    FOREIGN KEY (id_modalidade) REFERENCES modalidade(id)
);
CREATE TABLE reuniao_pessoa (
    id_pessoa INT NOT NULL,
    id_reuniao INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_reuniao) REFERENCES reuniao(id)
);
CREATE TABLE projeto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(250) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    data_inicial TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NOT NULL
);
CREATE TABLE pessoa_projeto(
    id_pessoa INT NOT NULL,
    id_projeto INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id)
);
CREATE TABLE turma (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(250) NOT NULL
);
CREATE TABLE curso (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(250) NOT NULL,
    nome VARCHAR(120) NOT NULL,
    descricao VARCHAR(250) NOT NULL
);
CREATE TABLE grade (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);
CREATE TABLE disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    descricao VARCHAR(250) NOT NULL
);
CREATE TABLE grade_disciplina (
    id_disciplina INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);
CREATE TABLE diario (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_entrega TIMESTAMP NOT NULL,
    id_disciplina INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    FOREIGN KEY (id_turma) REFERENCES turma(id)
);
CREATE TABLE pessoa_diario(
    id_pessoa INT NOT NULL,
    id_diario INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_diario) REFERENCES diario(id)
);
CREATE TABLE entrega_plano_ensino (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_pessoa INT NOT NULL,
    id_disciplina INT NOT NULL,
    data_entrega TIMESTAMP NOT NULL,
    acesso_turma NUMBER(1, 0) NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE horario_atendimento (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_ini TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NOT NULL,
    horario_ini TIMESTAMP NOT NULL,
    horario_fim TIMESTAMP NOT NULL
);
CREATE TABLE diario_horario(
    id_diario INT NOT NULL,
    id_horario INT NOT NULL,
    FOREIGN KEY (id_diario) REFERENCES diario(id),
    FOREIGN KEY (id_horario) REFERENCES horario_atendimento(id)
);
CREATE TABLE projeto_horario(
    id_projeto INT NOT NULL,
    id_horario INT NOT NULL,
    FOREIGN KEY (id_projeto) REFERENCES projeto(id),
    FOREIGN KEY (id_horario) REFERENCES horario_atendimento(id)
);
CREATE TABLE conselho (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_conselho TIMESTAMP NOT NULL,
    periodo INT NOT NULL,
    id_turma INT NOT NULL,
    id_modalidade INT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turma(id),
    FOREIGN KEY (id_modalidade) REFERENCES modalidade(id)
);
CREATE TABLE pessoa_conselho(
    id_pessoa INT NOT NULL,
    id_conselho INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_conselho) REFERENCES conselho(id)
);