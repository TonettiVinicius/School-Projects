
--
-- Banco de dados:  bd_hospital 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  enfermeira 
--

CREATE TABLE  enfermeira  (
   COREN  char(10) NOT NULL,
   CPF  char(11) DEFAULT NULL,
   nome  char(50) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(20) DEFAULT NULL,
   cidade  char(20) DEFAULT NULL,
   cep  char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  especialidade 
--

CREATE TABLE  especialidade  (
   cod  int(11) NOT NULL,
   documento  char(10) DEFAULT NULL,
   especialidade  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  hospital 
--

CREATE TABLE  hospital  (
   CNPJ  char(11) NOT NULL,
   nome  char(20) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(20) DEFAULT NULL,
   cidade  char(20) DEFAULT NULL,
   cep  char(8) DEFAULT NULL,
   telefone  char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  medico 
--

CREATE TABLE  medico  (
   CRM  char(10) NOT NULL,
   CPF  char(11) DEFAULT NULL,
   nome  char(50) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(20) DEFAULT NULL,
   cidade  char(20) DEFAULT NULL,
   cep  char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  medico_especialidade 
--

CREATE TABLE  medico_especialidade  (
   CRM  char(10) NOT NULL,
   cod  int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  medico_telefone 
--

CREATE TABLE  medico_telefone  (
   CRM  char(10) NOT NULL,
   cod  int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  paciente 
--

CREATE TABLE  paciente  (
   CPF  char(11) NOT NULL,
   RG  char(10) DEFAULT NULL,
   nome  char(50) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(20) DEFAULT NULL,
   cidade  char(20) DEFAULT NULL,
   cep  char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  telefone 
--

CREATE TABLE  telefone  (
   cod  int(11) NOT NULL,
   documento  char(10) DEFAULT NULL,
   telefone  char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  tratamento 
--

CREATE TABLE  tratamento  (
   CPF  char(11) NOT NULL,
   CRM  char(10) NOT NULL,
   CID  char(10) NOT NULL,
   data  date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  enfermeira 
--
ALTER TABLE  enfermeira 
  ADD PRIMARY KEY ( COREN );

--
-- Índices de tabela  especialidade 
--
ALTER TABLE  especialidade 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  hospital 
--
ALTER TABLE  hospital 
  ADD PRIMARY KEY ( CNPJ );

--
-- Índices de tabela  medico 
--
ALTER TABLE  medico 
  ADD PRIMARY KEY ( CRM );

--
-- Índices de tabela  medico_especialidade 
--
ALTER TABLE  medico_especialidade 
  ADD PRIMARY KEY ( CRM , cod ),
  ADD KEY  cod  ( cod );

--
-- Índices de tabela  medico_telefone 
--
ALTER TABLE  medico_telefone 
  ADD PRIMARY KEY ( CRM , cod ),
  ADD KEY  cod  ( cod );

--
-- Índices de tabela  paciente 
--
ALTER TABLE  paciente 
  ADD PRIMARY KEY ( CPF );

--
-- Índices de tabela  telefone 
--
ALTER TABLE  telefone 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  tratamento 
--
ALTER TABLE  tratamento 
  ADD PRIMARY KEY ( CPF , CRM , CID ),
  ADD KEY  CRM  ( CRM );

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  medico_especialidade 
--
ALTER TABLE  medico_especialidade 
  ADD CONSTRAINT  medico_especialidade_ibfk_1  FOREIGN KEY ( CRM ) REFERENCES  medico  ( CRM ),
  ADD CONSTRAINT  medico_especialidade_ibfk_2  FOREIGN KEY ( cod ) REFERENCES  especialidade  ( cod );

--
-- Restrições para tabelas  medico_telefone 
--
ALTER TABLE  medico_telefone 
  ADD CONSTRAINT  medico_telefone_ibfk_1  FOREIGN KEY ( CRM ) REFERENCES  medico  ( CRM ),
  ADD CONSTRAINT  medico_telefone_ibfk_2  FOREIGN KEY ( cod ) REFERENCES  telefone  ( cod );

--
-- Restrições para tabelas  tratamento 
--
ALTER TABLE  tratamento 
  ADD CONSTRAINT  tratamento_ibfk_1  FOREIGN KEY ( CPF ) REFERENCES  paciente  ( CPF ),
  ADD CONSTRAINT  tratamento_ibfk_2  FOREIGN KEY ( CRM ) REFERENCES  medico  ( CRM );
COMMIT;