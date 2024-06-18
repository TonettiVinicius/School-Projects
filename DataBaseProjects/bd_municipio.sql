
--
-- Banco de dados:  bdprefeito 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  estado 
--

CREATE TABLE  estado  (
   cod  int(11) NOT NULL,
   nome  varchar(50) DEFAULT NULL,
   Sigla  varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  município 
--

CREATE TABLE  município  (
   cod  int(11) NOT NULL,
   codEstado  int(11) NOT NULL,
   codPrefeitos  int(11) NOT NULL,
   codPaís  int(11) NOT NULL,
   Nome  varchar(50) DEFAULT NULL,
   População  varchar(50) DEFAULT NULL,
   Área  varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  país 
--

CREATE TABLE  país  (
   cod  int(11) NOT NULL,
   nome  varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  prefeito 
--

CREATE TABLE  prefeito  (
   Cod  int(11) NOT NULL,
   Nome  varchar(50) DEFAULT NULL,
   Partido  varchar(50) DEFAULT NULL,
   anoMandatoI  varchar(4) DEFAULT NULL,
   anoMandatoF  varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  estado 
--
ALTER TABLE  estado 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  município 
--
ALTER TABLE  município 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  FK_codEstado  ( codEstado ),
  ADD KEY  FK_codPrefeitos  ( codPrefeitos ),
  ADD KEY  FK_codPaís  ( codPaís );

--
-- Índices de tabela  país 
--
ALTER TABLE  país 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  prefeito 
--
ALTER TABLE  prefeito 
  ADD PRIMARY KEY ( Cod );

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  município 
--
ALTER TABLE  município 
  ADD CONSTRAINT  FK_codEstado  FOREIGN KEY ( codEstado ) REFERENCES  estado  ( cod ),
  ADD CONSTRAINT  FK_codPaís  FOREIGN KEY ( codPaís ) REFERENCES  país  ( cod ),
  ADD CONSTRAINT  FK_codPrefeitos  FOREIGN KEY ( codPrefeitos ) REFERENCES  prefeito  ( Cod );
COMMIT;
