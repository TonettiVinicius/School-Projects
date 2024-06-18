
--
-- Banco de dados:  bd_loja 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  acompanhamento_compra 
--

CREATE TABLE  acompanhamento_compra  (
   seq_acompanhamento_compra  int(11) NOT NULL,
   dat_hora_situacao  timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   cod_situacao_compra  int(11) DEFAULT NULL,
   num_item_compra  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  caracteristica 
--

CREATE TABLE  caracteristica  (
   cod_caracteristica  int(11) NOT NULL,
   nom_caracteristica  varchar(45) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  categoria 
--

CREATE TABLE  categoria  (
   cod_categoria  int(11) NOT NULL,
   nom_categoria  varchar(48) DEFAULT NULL,
   pos_categoria  int(11) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL,
   cod_departamento  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  cliente 
--

CREATE TABLE  cliente  (
   cod_cliente  int(11) NOT NULL,
   nom_cliente  varchar(100) NOT NULL,
   num_telefone  varchar(20) DEFAULT NULL,
   des_email  varchar(100) DEFAULT NULL,
   dat_nascimento  date DEFAULT NULL,
   cod_cidade  varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  compra 
--

CREATE TABLE  compra  (
   num_compra  int(11) NOT NULL,
   dat_hora_compra  timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
   cod_cliente  int(11) DEFAULT NULL,
   cod_condicao_pagamento  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  condicao_pagamento 
--

CREATE TABLE  condicao_pagamento  (
   cod_condicao_pagamento  int(11) NOT NULL,
   dsc_condicao_pagamento  varchar(45) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  departamento 
--

CREATE TABLE  departamento  (
   cod_departamento  int(11) NOT NULL,
   nom_departamento  varchar(48) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL,
   cod_grupo  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  fabricante 
--

CREATE TABLE  fabricante  (
   cod_fabricante  int(11) NOT NULL,
   nom_fabricante  varchar(100) DEFAULT NULL,
   sit_fabricante  varchar(250) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  grupo 
--

CREATE TABLE  grupo  (
   cod_grupo  int(11) NOT NULL,
   nom_grupo  varchar(48) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  item_compra 
--

CREATE TABLE  item_compra  (
   num_item_compra  int(11) NOT NULL,
   cod_produto  int(11) DEFAULT NULL,
   qtd_produto  int(11) DEFAULT NULL,
   pco_produto  decimal(10,2) DEFAULT NULL,
   val_produto  decimal(10,2) DEFAULT NULL,
   num_compra  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  prazo_cond_pagamento 
--

CREATE TABLE  prazo_cond_pagamento  (
   seq_prazo_cond_pagamento  int(11) NOT NULL,
   num_parcelas  int(11) DEFAULT NULL,
   cod_condicao_pagamento  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  produto 
--

CREATE TABLE  produto  (
   cod_produto  int(11) NOT NULL,
   nom_produto  varchar(250) DEFAULT NULL,
   dsc_produto_long  text DEFAULT NULL,
   dsc_produto_short  varchar(250) DEFAULT NULL,
   img_produto  varchar(250) DEFAULT NULL,
   val_produto  decimal(10,2) DEFAULT NULL,
   qtd_estoque  int(11) DEFAULT NULL,
   cod_fabricante  int(11) DEFAULT NULL,
   cod_categoria  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  produto_caracteristica 
--

CREATE TABLE  produto_caracteristica  (
   seq_produto_caracteristica  int(11) NOT NULL,
   val_caracteristica  varchar(100) DEFAULT NULL,
   cod_produto  int(11) DEFAULT NULL,
   cod_caracteristica  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  promocao 
--

CREATE TABLE  promocao  (
   cod_promocao  int(11) NOT NULL,
   nom_promocao  varchar(45) DEFAULT NULL,
   dat_hora_ini_promocao  time DEFAULT NULL,
   dat_hora_fim_promocao  time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  promocao_produto 
--

CREATE TABLE  promocao_produto  (
   seq_promocao_produto  int(11) NOT NULL,
   pco_produto  decimal(10,2) DEFAULT NULL,
   cod_condicao_pagamento  int(11) DEFAULT NULL,
   cod_promocao  int(11) DEFAULT NULL,
   cod_produto  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  situacao_compra 
--

CREATE TABLE  situacao_compra  (
   cod_situacao_compra  int(11) NOT NULL,
   dsc_situacao_compra  varchar(45) DEFAULT NULL,
   df_ativo  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  acompanhamento_compra 
--
ALTER TABLE  acompanhamento_compra 
  ADD PRIMARY KEY ( seq_acompanhamento_compra ),
  ADD KEY  cod_situacao_compra  ( cod_situacao_compra ),
  ADD KEY  num_item_compra  ( num_item_compra );

--
-- Índices de tabela  caracteristica 
--
ALTER TABLE  caracteristica 
  ADD PRIMARY KEY ( cod_caracteristica );

--
-- Índices de tabela  categoria 
--
ALTER TABLE  categoria 
  ADD PRIMARY KEY ( cod_categoria ),
  ADD KEY  cod_departamento  ( cod_departamento );

--
-- Índices de tabela  cliente 
--
ALTER TABLE  cliente 
  ADD PRIMARY KEY ( cod_cliente );

--
-- Índices de tabela  compra 
--
ALTER TABLE  compra 
  ADD PRIMARY KEY ( num_compra ),
  ADD KEY  cod_cliente  ( cod_cliente ),
  ADD KEY  cod_condicao_pagamento  ( cod_condicao_pagamento );

--
-- Índices de tabela  condicao_pagamento 
--
ALTER TABLE  condicao_pagamento 
  ADD PRIMARY KEY ( cod_condicao_pagamento );

--
-- Índices de tabela  departamento 
--
ALTER TABLE  departamento 
  ADD PRIMARY KEY ( cod_departamento ),
  ADD KEY  cod_grupo  ( cod_grupo );

--
-- Índices de tabela  fabricante 
--
ALTER TABLE  fabricante 
  ADD PRIMARY KEY ( cod_fabricante );

--
-- Índices de tabela  grupo 
--
ALTER TABLE  grupo 
  ADD PRIMARY KEY ( cod_grupo );

--
-- Índices de tabela  item_compra 
--
ALTER TABLE  item_compra 
  ADD PRIMARY KEY ( num_item_compra ),
  ADD KEY  cod_produto  ( cod_produto ),
  ADD KEY  num_compra  ( num_compra );

--
-- Índices de tabela  prazo_cond_pagamento 
--
ALTER TABLE  prazo_cond_pagamento 
  ADD PRIMARY KEY ( seq_prazo_cond_pagamento ),
  ADD KEY  cod_condicao_pagamento  ( cod_condicao_pagamento );

--
-- Índices de tabela  produto 
--
ALTER TABLE  produto 
  ADD PRIMARY KEY ( cod_produto ),
  ADD KEY  cod_fabricante  ( cod_fabricante ),
  ADD KEY  cod_categoria  ( cod_categoria );

--
-- Índices de tabela  produto_caracteristica 
--
ALTER TABLE  produto_caracteristica 
  ADD PRIMARY KEY ( seq_produto_caracteristica ),
  ADD KEY  cod_produto  ( cod_produto ),
  ADD KEY  cod_caracteristica  ( cod_caracteristica );

--
-- Índices de tabela  promocao 
--
ALTER TABLE  promocao 
  ADD PRIMARY KEY ( cod_promocao );

--
-- Índices de tabela  promocao_produto 
--
ALTER TABLE  promocao_produto 
  ADD PRIMARY KEY ( seq_promocao_produto ),
  ADD KEY  cod_condicao_pagamento  ( cod_condicao_pagamento ),
  ADD KEY  cod_promocao  ( cod_promocao ),
  ADD KEY  cod_produto  ( cod_produto );

--
-- Índices de tabela  situacao_compra 
--
ALTER TABLE  situacao_compra 
  ADD PRIMARY KEY ( cod_situacao_compra );

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela  acompanhamento_compra 
--
ALTER TABLE  acompanhamento_compra 
  MODIFY  seq_acompanhamento_compra  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  caracteristica 
--
ALTER TABLE  caracteristica 
  MODIFY  cod_caracteristica  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  categoria 
--
ALTER TABLE  categoria 
  MODIFY  cod_categoria  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  cliente 
--
ALTER TABLE  cliente 
  MODIFY  cod_cliente  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  compra 
--
ALTER TABLE  compra 
  MODIFY  num_compra  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  condicao_pagamento 
--
ALTER TABLE  condicao_pagamento 
  MODIFY  cod_condicao_pagamento  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  departamento 
--
ALTER TABLE  departamento 
  MODIFY  cod_departamento  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  fabricante 
--
ALTER TABLE  fabricante 
  MODIFY  cod_fabricante  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  grupo 
--
ALTER TABLE  grupo 
  MODIFY  cod_grupo  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  item_compra 
--
ALTER TABLE  item_compra 
  MODIFY  num_item_compra  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  prazo_cond_pagamento 
--
ALTER TABLE  prazo_cond_pagamento 
  MODIFY  seq_prazo_cond_pagamento  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  produto 
--
ALTER TABLE  produto 
  MODIFY  cod_produto  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  produto_caracteristica 
--
ALTER TABLE  produto_caracteristica 
  MODIFY  seq_produto_caracteristica  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  promocao 
--
ALTER TABLE  promocao 
  MODIFY  cod_promocao  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  promocao_produto 
--
ALTER TABLE  promocao_produto 
  MODIFY  seq_promocao_produto  int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela  situacao_compra 
--
ALTER TABLE  situacao_compra 
  MODIFY  cod_situacao_compra  int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  acompanhamento_compra 
--
ALTER TABLE  acompanhamento_compra 
  ADD CONSTRAINT  acompanhamento_compra_ibfk_1  FOREIGN KEY ( cod_situacao_compra ) REFERENCES  situacao_compra  ( cod_situacao_compra ),
  ADD CONSTRAINT  acompanhamento_compra_ibfk_2  FOREIGN KEY ( num_item_compra ) REFERENCES  item_compra  ( num_item_compra );

--
-- Restrições para tabelas  categoria 
--
ALTER TABLE  categoria 
  ADD CONSTRAINT  categoria_ibfk_1  FOREIGN KEY ( cod_departamento ) REFERENCES  departamento  ( cod_departamento );

--
-- Restrições para tabelas  compra 
--
ALTER TABLE  compra 
  ADD CONSTRAINT  compra_ibfk_1  FOREIGN KEY ( cod_cliente ) REFERENCES  cliente  ( cod_cliente ),
  ADD CONSTRAINT  compra_ibfk_2  FOREIGN KEY ( cod_condicao_pagamento ) REFERENCES  condicao_pagamento  ( cod_condicao_pagamento );

--
-- Restrições para tabelas  departamento 
--
ALTER TABLE  departamento 
  ADD CONSTRAINT  departamento_ibfk_1  FOREIGN KEY ( cod_grupo ) REFERENCES  grupo  ( cod_grupo );

--
-- Restrições para tabelas  item_compra 
--
ALTER TABLE  item_compra 
  ADD CONSTRAINT  item_compra_ibfk_1  FOREIGN KEY ( cod_produto ) REFERENCES  produto  ( cod_produto ),
  ADD CONSTRAINT  item_compra_ibfk_2  FOREIGN KEY ( num_compra ) REFERENCES  compra  ( num_compra );

--
-- Restrições para tabelas  prazo_cond_pagamento 
--
ALTER TABLE  prazo_cond_pagamento 
  ADD CONSTRAINT  prazo_cond_pagamento_ibfk_1  FOREIGN KEY ( cod_condicao_pagamento ) REFERENCES  condicao_pagamento  ( cod_condicao_pagamento );

--
-- Restrições para tabelas  produto 
--
ALTER TABLE  produto 
  ADD CONSTRAINT  produto_ibfk_1  FOREIGN KEY ( cod_fabricante ) REFERENCES  fabricante  ( cod_fabricante ),
  ADD CONSTRAINT  produto_ibfk_2  FOREIGN KEY ( cod_categoria ) REFERENCES  categoria  ( cod_categoria );

--
-- Restrições para tabelas  produto_caracteristica 
--
ALTER TABLE  produto_caracteristica 
  ADD CONSTRAINT  produto_caracteristica_ibfk_1  FOREIGN KEY ( cod_produto ) REFERENCES  produto  ( cod_produto ),
  ADD CONSTRAINT  produto_caracteristica_ibfk_2  FOREIGN KEY ( cod_caracteristica ) REFERENCES  caracteristica  ( cod_caracteristica );

--
-- Restrições para tabelas  promocao_produto 
--
ALTER TABLE  promocao_produto 
  ADD CONSTRAINT  promocao_produto_ibfk_1  FOREIGN KEY ( cod_condicao_pagamento ) REFERENCES  condicao_pagamento  ( cod_condicao_pagamento ),
  ADD CONSTRAINT  promocao_produto_ibfk_2  FOREIGN KEY ( cod_promocao ) REFERENCES  promocao  ( cod_promocao ),
  ADD CONSTRAINT  promocao_produto_ibfk_3  FOREIGN KEY ( cod_produto ) REFERENCES  produto  ( cod_produto );
COMMIT;
