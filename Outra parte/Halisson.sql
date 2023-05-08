CREATE TABLE endereco(
    id INT NOT NULL AUTO_INCREMENT,
    rua VARCHAR(150) NOT NULL,
    bairro VARCHAR(120) NOT NULL,
    complemento VARCHAR(200),
    numero INT NOT NULL,
    UF VARCHAR(3) NOT NULL,
    nome_cidade VARCHAR(150) NOT NULL,
    CEP INT NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE pessoa (
    id INT NOT NULL AUTO_INCREMENT,
    matricula VARCHAR(12) NOT NULL,
    nome VARCHAR(40) NOT NULL,
    cargo VARCHAR(40) NOT NULL,
    data_nascimento TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_matricula TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    carga_horaria INT NOT NULL,
    email VARCHAR(200) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    id_endereco INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_endereco) REFERENCES endereco(id)
);
CREATE TABLE afastamento (
    id INT NOT NULL AUTO_INCREMENT,
    data_inicial TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_final TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    descricao VARCHAR(240),
    id_pessoa INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE atestado(
    id INT NOT NULL AUTO_INCREMENT,
    motivo VARCHAR(250) NOT NULL,
    data_inicial TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_final TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacoes VARCHAR(250) NOT NULL,
    id_pessoa INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE assiduidade (
    id INT NOT NULL AUTO_INCREMENT,
    data_matricula TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    assiduidade BIT NOT NULL,
    id_pessoa INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE modalidade (
    id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(125) NOT NULL,
    observacao VARCHAR(250),
	PRIMARY KEY (id)
);

CREATE TABLE reuniao (
    id INT NOT NULL AUTO_INCREMENT,
    id_modalidade INT NOT NULL,
    data_reuniao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo VARCHAR(150) NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_modalidade) REFERENCES modalidade(id)
);
CREATE TABLE reuniao_pessoa (
    id_pessoa INT NOT NULL,
    id_reuniao INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_reuniao) REFERENCES reuniao(id)
);
CREATE TABLE projeto (
    id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(250) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    data_inicial TIMESTAMP NOT NULL,
	PRIMARY KEY (id),
    data_fim TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE pessoa_projeto(
    id_pessoa INT NOT NULL,
    id_projeto INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_projeto) REFERENCES projeto(id)
);
CREATE TABLE turma (
    id INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(250) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE curso (
    id INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(250) NOT NULL,
    nome VARCHAR(120) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE grade (
    id INT NOT NULL AUTO_INCREMENT,
    id_curso INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);
CREATE TABLE disciplina (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(120) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE grade_disciplina (
    id_disciplina INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    FOREIGN KEY (id_curso) REFERENCES curso(id)
);
CREATE TABLE diario (
    id INT NOT NULL AUTO_INCREMENT,
    data_entrega TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    id_disciplina INT NOT NULL,
    id_turma INT NOT NULL,
	PRIMARY KEY (id),
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
    id INT NOT NULL AUTO_INCREMENT,
    id_pessoa INT NOT NULL,
    id_disciplina INT NOT NULL,
    data_entrega TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    acesso_turma BIT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);
CREATE TABLE horario_atendimento (
    id INT NOT NULL AUTO_INCREMENT,
    data_ini TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_fim TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    horario_ini TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    horario_fim TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
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
    id INT NOT NULL AUTO_INCREMENT,
    data_conselho TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    periodo INT NOT NULL,
    id_turma INT NOT NULL,
    id_modalidade INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_turma) REFERENCES turma(id),
    FOREIGN KEY (id_modalidade) REFERENCES modalidade(id)
);
CREATE TABLE pessoa_conselho(
    id_pessoa INT NOT NULL,
    id_conselho INT NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
    FOREIGN KEY (id_conselho) REFERENCES conselho(id)
);