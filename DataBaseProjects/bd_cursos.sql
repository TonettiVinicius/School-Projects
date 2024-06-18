
--
-- Banco de dados:  bd_cursos 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  aluno 
--

CREATE TABLE  aluno  (
   RM  char(11) NOT NULL,
   RG  char(11) DEFAULT NULL,
   Nome  char(50) DEFAULT NULL,
   Responsavel  char(50) DEFAULT NULL,
   dataNascimento  date DEFAULT NULL,
   Rua  char(50) DEFAULT NULL,
   Bairro  char(50) DEFAULT NULL,
   CEP  char(8) DEFAULT NULL,
   Cidade  char(50) DEFAULT NULL,
   Estado  char(2) DEFAULT NULL,
   Email  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  aluno_curso 
--

CREATE TABLE  aluno_curso  (
   cod  int(4) NOT NULL,
   RM_Aluno  char(11) DEFAULT NULL,
   codCurso  int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  cursos 
--

CREATE TABLE  cursos  (
   cod  int(4) NOT NULL,
   nome  char(50) DEFAULT NULL,
   preco  decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  curso_duracao 
--

CREATE TABLE  curso_duracao  (
   cod  int(4) NOT NULL,
   codDuracao  int(4) DEFAULT NULL,
   codCurso  int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  duracao 
--

CREATE TABLE  duracao  (
   cod  int(4) NOT NULL,
   duracao  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  empresa 
--

CREATE TABLE  empresa  (
   CNPJ  char(14) NOT NULL,
   InscricaoEstadual  char(13) DEFAULT NULL,
   RazaoSocial  char(50) DEFAULT NULL,
   NomeFantasia  char(50) DEFAULT NULL,
   dataConstituicao  date DEFAULT NULL,
   Rua  char(50) DEFAULT NULL,
   Bairro  char(50) DEFAULT NULL,
   CEP  char(8) DEFAULT NULL,
   Cidade  char(50) DEFAULT NULL,
   Estado  char(2) DEFAULT NULL,
   Telefone  char(10) DEFAULT NULL,
   Email  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  especializacao 
--

CREATE TABLE  especializacao  (
   cod  int(4) NOT NULL,
   Especializacao  char(50) DEFAULT NULL,
   ano  char(4) DEFAULT NULL,
   Responsavel  char(50) DEFAULT NULL,
   CargaHoraria  char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  professor 
--

CREATE TABLE  professor  (
   CPF  char(11) NOT NULL,
   Nome  char(50) DEFAULT NULL,
   dataAdmissao  date DEFAULT NULL,
   dataNascimento  date DEFAULT NULL,
   Rua  char(50) DEFAULT NULL,
   Bairro  char(50) DEFAULT NULL,
   CEP  char(8) DEFAULT NULL,
   Cidade  char(50) DEFAULT NULL,
   Estado  char(2) DEFAULT NULL,
   Email  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  professor_curso 
--

CREATE TABLE  professor_curso  (
   cod  int(4) NOT NULL,
   CPF_Professor  char(11) DEFAULT NULL,
   codCurso  int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  professor_pagamento 
--

CREATE TABLE  professor_pagamento  (
   cod  int(4) NOT NULL,
   CPF_Professor  char(11) DEFAULT NULL,
   horaTrabalhadas  int(5) DEFAULT NULL,
   valorHoraAula  decimal(20,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  telefone 
--

CREATE TABLE  telefone  (
   cod  int(4) NOT NULL,
   Documento  char(14) DEFAULT NULL,
   telefone  char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  aluno 
--
ALTER TABLE  aluno 
  ADD PRIMARY KEY ( RM );

--
-- Índices de tabela  aluno_curso 
--
ALTER TABLE  aluno_curso 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  RM_Aluno  ( RM_Aluno ),
  ADD KEY  codCurso  ( codCurso );

--
-- Índices de tabela  cursos 
--
ALTER TABLE  cursos 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  curso_duracao 
--
ALTER TABLE  curso_duracao 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  codDuracao  ( codDuracao ),
  ADD KEY  codCurso  ( codCurso );

--
-- Índices de tabela  duracao 
--
ALTER TABLE  duracao 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  empresa 
--
ALTER TABLE  empresa 
  ADD PRIMARY KEY ( CNPJ );

--
-- Índices de tabela  especializacao 
--
ALTER TABLE  especializacao 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  professor 
--
ALTER TABLE  professor 
  ADD PRIMARY KEY ( CPF );

--
-- Índices de tabela  professor_curso 
--
ALTER TABLE  professor_curso 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  CPF_Professor  ( CPF_Professor ),
  ADD KEY  codCurso  ( codCurso );

--
-- Índices de tabela  professor_pagamento 
--
ALTER TABLE  professor_pagamento 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  CPF_Professor  ( CPF_Professor );

--
-- Índices de tabela  telefone 
--
ALTER TABLE  telefone 
  ADD PRIMARY KEY ( cod );

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  aluno_curso 
--
ALTER TABLE  aluno_curso 
  ADD CONSTRAINT  aluno_curso_ibfk_1  FOREIGN KEY ( RM_Aluno ) REFERENCES  aluno  ( RM ),
  ADD CONSTRAINT  aluno_curso_ibfk_2  FOREIGN KEY ( codCurso ) REFERENCES  cursos  ( cod );

--
-- Restrições para tabelas  curso_duracao 
--
ALTER TABLE  curso_duracao 
  ADD CONSTRAINT  curso_duracao_ibfk_1  FOREIGN KEY ( codDuracao ) REFERENCES  duracao  ( cod ),
  ADD CONSTRAINT  curso_duracao_ibfk_2  FOREIGN KEY ( codCurso ) REFERENCES  cursos  ( cod );

--
-- Restrições para tabelas  professor_curso 
--
ALTER TABLE  professor_curso 
  ADD CONSTRAINT  professor_curso_ibfk_1  FOREIGN KEY ( CPF_Professor ) REFERENCES  professor  ( CPF ),
  ADD CONSTRAINT  professor_curso_ibfk_2  FOREIGN KEY ( codCurso ) REFERENCES  cursos  ( cod );

--
-- Restrições para tabelas  professor_pagamento 
--
ALTER TABLE  professor_pagamento 
  ADD CONSTRAINT  professor_pagamento_ibfk_1  FOREIGN KEY ( CPF_Professor ) REFERENCES  professor  ( CPF );
COMMIT;