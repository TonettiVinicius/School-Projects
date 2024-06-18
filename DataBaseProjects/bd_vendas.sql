
--
-- Banco de dados:  bd_vendas 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  categoria 
--

CREATE TABLE  categoria  (
   id  int(11) NOT NULL,
   nome  varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  cliente 
--

CREATE TABLE  cliente  (
   id  int(11) NOT NULL,
   nome  varchar(45) NOT NULL,
   telefone  varchar(45) DEFAULT NULL,
   email  varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  fornecedores 
--

CREATE TABLE  fornecedores  (
   id  int(11) NOT NULL,
   cnpj  varchar(45) DEFAULT NULL,
   nome  varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  pagamento 
--

CREATE TABLE  pagamento  (
   id  int(11) NOT NULL,
   forma_pagamento  varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  produto 
--

CREATE TABLE  produto  (
   id  int(11) NOT NULL,
   nome  varchar(45) NOT NULL,
   preco  decimal(10,2) DEFAULT NULL,
   qtd_estoque  varchar(45) DEFAULT NULL,
   categoria_id  int(11) DEFAULT NULL,
   fornecedores_id  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  venda 
--

CREATE TABLE  venda  (
   id  int(11) NOT NULL,
   valor_total  decimal(10,2) DEFAULT NULL,
   data  datetime DEFAULT NULL,
   cliente_id  int(11) DEFAULT NULL,
   vendedor_id  int(11) DEFAULT NULL,
   pagamento_id  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  venda_has_produto 
--

CREATE TABLE  venda_has_produto  (
   venda_id  int(11) NOT NULL,
   produto_id  int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  vendedor 
--

CREATE TABLE  vendedor  (
   id  int(11) NOT NULL,
   nome  varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  categoria 
--
ALTER TABLE  categoria 
  ADD PRIMARY KEY ( id );

--
-- Índices de tabela  cliente 
--
ALTER TABLE  cliente 
  ADD PRIMARY KEY ( id );

--
-- Índices de tabela  fornecedores 
--
ALTER TABLE  fornecedores 
  ADD PRIMARY KEY ( id );

--
-- Índices de tabela  pagamento 
--
ALTER TABLE  pagamento 
  ADD PRIMARY KEY ( id );

--
-- Índices de tabela  produto 
--
ALTER TABLE  produto 
  ADD PRIMARY KEY ( id ),
  ADD KEY  categoria_id  ( categoria_id ),
  ADD KEY  fornecedores_id  ( fornecedores_id );

--
-- Índices de tabela  venda 
--
ALTER TABLE  venda 
  ADD PRIMARY KEY ( id ),
  ADD KEY  cliente_id  ( cliente_id ),
  ADD KEY  vendedor_id  ( vendedor_id ),
  ADD KEY  pagamento_id  ( pagamento_id );

--
-- Índices de tabela  venda_has_produto 
--
ALTER TABLE  venda_has_produto 
  ADD PRIMARY KEY ( venda_id , produto_id ),
  ADD KEY  produto_id  ( produto_id );

--
-- Índices de tabela  vendedor 
--
ALTER TABLE  vendedor 
  ADD PRIMARY KEY ( id );

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela  categoria 
--
ALTER TABLE  categoria 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  cliente 
--
ALTER TABLE  cliente 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  fornecedores 
--
ALTER TABLE  fornecedores 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  pagamento 
--
ALTER TABLE  pagamento 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  produto 
--
ALTER TABLE  produto 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  venda 
--
ALTER TABLE  venda 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  vendedor 
--
ALTER TABLE  vendedor 
  MODIFY  id  int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  produto 
--
ALTER TABLE  produto 
  ADD CONSTRAINT  produto_ibfk_1  FOREIGN KEY ( categoria_id ) REFERENCES  categoria  ( id ),
  ADD CONSTRAINT  produto_ibfk_2  FOREIGN KEY ( fornecedores_id ) REFERENCES  fornecedores  ( id );

--
-- Restrições para tabelas  venda 
--
ALTER TABLE  venda 
  ADD CONSTRAINT  venda_ibfk_1  FOREIGN KEY ( cliente_id ) REFERENCES  cliente  ( id ),
  ADD CONSTRAINT  venda_ibfk_2  FOREIGN KEY ( vendedor_id ) REFERENCES  vendedor  ( id ),
  ADD CONSTRAINT  venda_ibfk_3  FOREIGN KEY ( pagamento_id ) REFERENCES  pagamento  ( id );

--
-- Restrições para tabelas  venda_has_produto 
--
ALTER TABLE  venda_has_produto 
  ADD CONSTRAINT  venda_has_produto_ibfk_1  FOREIGN KEY ( venda_id ) REFERENCES  venda  ( id ),
  ADD CONSTRAINT  venda_has_produto_ibfk_2  FOREIGN KEY ( produto_id ) REFERENCES  produto  ( id );
COMMIT;