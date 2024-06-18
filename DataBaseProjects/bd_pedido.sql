
--
-- Banco de dados:  bd_pedido 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  carro 
--

CREATE TABLE  carro  (
   cod  int(11) NOT NULL,
   marca  char(30) DEFAULT NULL,
   modelo  char(50) DEFAULT NULL,
   estado  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  cliente 
--

CREATE TABLE  cliente  (
   CPF  char(11) NOT NULL,
   nome  char(50) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(50) DEFAULT NULL,
   cidade  char(50) DEFAULT NULL,
   cep  char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  equipamento 
--

CREATE TABLE  equipamento  (
   cod  int(11) NOT NULL,
   descricao  char(50) DEFAULT NULL,
   dataCompra  date DEFAULT NULL,
   valor  decimal(10,2) DEFAULT NULL,
   estado  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  funcionario 
--

CREATE TABLE  funcionario  (
   registro  int(11) NOT NULL,
   CPF  char(11) DEFAULT NULL,
   nome  char(50) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(50) DEFAULT NULL,
   cidade  char(50) DEFAULT NULL,
   cep  char(8) DEFAULT NULL,
   dataAdmissao  date DEFAULT NULL,
   cargo  char(50) DEFAULT NULL,
   departamento  char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  funcionario_projeto 
--

CREATE TABLE  funcionario_projeto  (
   cod  int(11) NOT NULL,
   funcionario_numero  int(11) DEFAULT NULL,
   equipamento_cod  int(11) DEFAULT NULL,
   projeto_numero  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  motorista 
--

CREATE TABLE  motorista  (
   registro  int(11) NOT NULL,
   CPF  char(11) DEFAULT NULL,
   nome  char(50) DEFAULT NULL,
   rua  char(50) DEFAULT NULL,
   bairro  char(50) DEFAULT NULL,
   cidade  char(50) DEFAULT NULL,
   cep  char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  motorista_carro 
--

CREATE TABLE  motorista_carro  (
   cod  int(11) NOT NULL,
   motorista_numero  int(11) DEFAULT NULL,
   carro_numero  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  notafiscal 
--

CREATE TABLE  notafiscal  (
   numero  int(11) NOT NULL,
   pedido_numero  int(11) DEFAULT NULL,
   dataEmissao  date DEFAULT NULL,
   valor  decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  pedido 
--

CREATE TABLE  pedido  (
   numero  int(11) NOT NULL,
   cliente_CPF  char(11) DEFAULT NULL,
   produto_cod  int(11) DEFAULT NULL,
   dataEmissao  date DEFAULT NULL,
   status  char(10) DEFAULT NULL,
   quantidade  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  produto 
--

CREATE TABLE  produto  (
   cod  int(11) NOT NULL,
   nome  char(50) DEFAULT NULL,
   quantidade  int(11) DEFAULT NULL,
   precoCusto  decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  projeto 
--

CREATE TABLE  projeto  (
   cod  int(11) NOT NULL,
   nome  char(50) DEFAULT NULL,
   dataInicio  date DEFAULT NULL,
   dataFinal  date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  telefone 
--

CREATE TABLE  telefone  (
   cod  int(11) NOT NULL,
   pessoa  char(50) DEFAULT NULL,
   telefone  char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  carro 
--
ALTER TABLE  carro 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  cliente 
--
ALTER TABLE  cliente 
  ADD PRIMARY KEY ( CPF );

--
-- Índices de tabela  equipamento 
--
ALTER TABLE  equipamento 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  funcionario 
--
ALTER TABLE  funcionario 
  ADD PRIMARY KEY ( registro );

--
-- Índices de tabela  funcionario_projeto 
--
ALTER TABLE  funcionario_projeto 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  funcionario_numero  ( funcionario_numero ),
  ADD KEY  equipamento_cod  ( equipamento_cod ),
  ADD KEY  projeto_numero  ( projeto_numero );

--
-- Índices de tabela  motorista 
--
ALTER TABLE  motorista 
  ADD PRIMARY KEY ( registro );

--
-- Índices de tabela  motorista_carro 
--
ALTER TABLE  motorista_carro 
  ADD PRIMARY KEY ( cod ),
  ADD KEY  motorista_numero  ( motorista_numero ),
  ADD KEY  carro_numero  ( carro_numero );

--
-- Índices de tabela  notafiscal 
--
ALTER TABLE  notafiscal 
  ADD PRIMARY KEY ( numero ),
  ADD KEY  pedido_numero  ( pedido_numero );

--
-- Índices de tabela  pedido 
--
ALTER TABLE  pedido 
  ADD PRIMARY KEY ( numero ),
  ADD KEY  cliente_CPF  ( cliente_CPF ),
  ADD KEY  produto_cod  ( produto_cod );

--
-- Índices de tabela  produto 
--
ALTER TABLE  produto 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  projeto 
--
ALTER TABLE  projeto 
  ADD PRIMARY KEY ( cod );

--
-- Índices de tabela  telefone 
--
ALTER TABLE  telefone 
  ADD PRIMARY KEY ( cod );

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela  funcionario_projeto 
--
ALTER TABLE  funcionario_projeto 
  MODIFY  cod  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  motorista_carro 
--
ALTER TABLE  motorista_carro 
  MODIFY  cod  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  telefone 
--
ALTER TABLE  telefone 
  MODIFY  cod  int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  funcionario_projeto 
--
ALTER TABLE  funcionario_projeto 
  ADD CONSTRAINT  funcionario_projeto_ibfk_1  FOREIGN KEY ( funcionario_numero ) REFERENCES  funcionario  ( registro ),
  ADD CONSTRAINT  funcionario_projeto_ibfk_2  FOREIGN KEY ( equipamento_cod ) REFERENCES  equipamento  ( cod ),
  ADD CONSTRAINT  funcionario_projeto_ibfk_3  FOREIGN KEY ( projeto_numero ) REFERENCES  projeto  ( cod );

--
-- Restrições para tabelas  motorista_carro 
--
ALTER TABLE  motorista_carro 
  ADD CONSTRAINT  motorista_carro_ibfk_1  FOREIGN KEY ( motorista_numero ) REFERENCES  motorista  ( registro ),
  ADD CONSTRAINT  motorista_carro_ibfk_2  FOREIGN KEY ( carro_numero ) REFERENCES  carro  ( cod );

--
-- Restrições para tabelas  notafiscal 
--
ALTER TABLE  notafiscal 
  ADD CONSTRAINT  notafiscal_ibfk_1  FOREIGN KEY ( pedido_numero ) REFERENCES  pedido  ( numero );

--
-- Restrições para tabelas  pedido 
--
ALTER TABLE  pedido 
  ADD CONSTRAINT  pedido_ibfk_1  FOREIGN KEY ( cliente_CPF ) REFERENCES  cliente  ( CPF ),
  ADD CONSTRAINT  pedido_ibfk_2  FOREIGN KEY ( produto_cod ) REFERENCES  produto  ( cod );
COMMIT;