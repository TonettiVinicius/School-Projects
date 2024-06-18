
--
-- Banco de dados:   bd_livraria  
--

-- --------------------------------------------------------

--
-- Estrutura para tabela   autor  
--

CREATE TABLE   autor   (
    codigo   int(11) NOT NULL,
    nome   varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   autoria  
--

CREATE TABLE   autoria   (
    livro_isbn   varchar(45) NOT NULL,
    autor_codigo   int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   editora  
--

CREATE TABLE   editora   (
    codigo   int(11) NOT NULL,
    nome   varchar(255) NOT NULL,
    cidade   varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   emprestimo  
--

CREATE TABLE   emprestimo   (
    exemplar_livro_isbn   varchar(45) NOT NULL,
    exemplar_codigo   int(11) NOT NULL,
    usuario_cpf   varchar(11) NOT NULL,
    data_emprestimo   date DEFAULT NULL,
    data_entrega   date DEFAULT NULL,
    prazo   int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   exemplar  
--

CREATE TABLE   exemplar   (
    livro_isbn   varchar(45) DEFAULT NULL,
    codigo   int(11) NOT NULL,
    status   enum('0','1','2') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   genero  
--

CREATE TABLE   genero   (
    codigo   int(11) NOT NULL,
    nome   varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   livro  
--

CREATE TABLE   livro   (
    isbn   varchar(45) NOT NULL,
    titulo   varchar(255) NOT NULL,
    edicao   int(11) DEFAULT NULL,
    volume   int(11) DEFAULT NULL,
    genero_codigo   int(11) DEFAULT NULL,
    editora_codigo   int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   perfil  
--

CREATE TABLE   perfil   (
    codigo   int(11) NOT NULL,
    nome   varchar(255) NOT NULL,
    limite   int(11) DEFAULT NULL,
    prazo   int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela   usuario  
--

CREATE TABLE   usuario   (
    cpf   varchar(11) NOT NULL,
    nome   varchar(255) NOT NULL,
    endereco   varchar(255) DEFAULT NULL,
    telefone   varchar(255) DEFAULT NULL,
    email   varchar(255) DEFAULT NULL,
    perfil_codigo   int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela   autor  
--
ALTER TABLE   autor  
  ADD PRIMARY KEY (  codigo  );

--
-- Índices de tabela   autoria  
--
ALTER TABLE   autoria  
  ADD PRIMARY KEY (  livro_isbn  ,  autor_codigo  ),
  ADD KEY   autor_codigo   (  autor_codigo  );

--
-- Índices de tabela   editora  
--
ALTER TABLE   editora  
  ADD PRIMARY KEY (  codigo  );

--
-- Índices de tabela   emprestimo  
--
ALTER TABLE   emprestimo  
  ADD PRIMARY KEY (  exemplar_livro_isbn  ,  exemplar_codigo  ,  usuario_cpf  ),
  ADD KEY   exemplar_codigo   (  exemplar_codigo  ),
  ADD KEY   usuario_cpf   (  usuario_cpf  );

--
-- Índices de tabela   exemplar  
--
ALTER TABLE   exemplar  
  ADD PRIMARY KEY (  codigo  ),
  ADD KEY   livro_isbn   (  livro_isbn  );

--
-- Índices de tabela   genero  
--
ALTER TABLE   genero  
  ADD PRIMARY KEY (  codigo  );

--
-- Índices de tabela   livro  
--
ALTER TABLE   livro  
  ADD PRIMARY KEY (  isbn  ),
  ADD KEY   genero_codigo   (  genero_codigo  ),
  ADD KEY   editora_codigo   (  editora_codigo  );

--
-- Índices de tabela   perfil  
--
ALTER TABLE   perfil  
  ADD PRIMARY KEY (  codigo  );

--
-- Índices de tabela   usuario  
--
ALTER TABLE   usuario  
  ADD PRIMARY KEY (  cpf  ),
  ADD KEY   perfil_codigo   (  perfil_codigo  );

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela   autor  
--
ALTER TABLE   autor  
  MODIFY   codigo   int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela   editora  
--
ALTER TABLE   editora  
  MODIFY   codigo   int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela   exemplar  
--
ALTER TABLE   exemplar  
  MODIFY   codigo   int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela   genero  
--
ALTER TABLE   genero  
  MODIFY   codigo   int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela   perfil  
--
ALTER TABLE   perfil  
  MODIFY   codigo   int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas   autoria  
--
ALTER TABLE   autoria  
  ADD CONSTRAINT   autoria_ibfk_1   FOREIGN KEY (  livro_isbn  ) REFERENCES   livro   (  isbn  ),
  ADD CONSTRAINT   autoria_ibfk_2   FOREIGN KEY (  autor_codigo  ) REFERENCES   autor   (  codigo  );

--
-- Restrições para tabelas   emprestimo  
--
ALTER TABLE   emprestimo  
  ADD CONSTRAINT   emprestimo_ibfk_1   FOREIGN KEY (  exemplar_livro_isbn  ) REFERENCES   exemplar   (  livro_isbn  ),
  ADD CONSTRAINT   emprestimo_ibfk_2   FOREIGN KEY (  exemplar_codigo  ) REFERENCES   exemplar   (  codigo  ),
  ADD CONSTRAINT   emprestimo_ibfk_3   FOREIGN KEY (  usuario_cpf  ) REFERENCES   usuario   (  cpf  );

--
-- Restrições para tabelas   exemplar  
--
ALTER TABLE   exemplar  
  ADD CONSTRAINT   exemplar_ibfk_1   FOREIGN KEY (  livro_isbn  ) REFERENCES   livro   (  isbn  );

--
-- Restrições para tabelas   livro  
--
ALTER TABLE   livro  
  ADD CONSTRAINT   livro_ibfk_1   FOREIGN KEY (  genero_codigo  ) REFERENCES   genero   (  codigo  ),
  ADD CONSTRAINT   livro_ibfk_2   FOREIGN KEY (  editora_codigo  ) REFERENCES   editora   (  codigo  );

--
-- Restrições para tabelas   usuario  
--
ALTER TABLE   usuario  
  ADD CONSTRAINT   usuario_ibfk_1   FOREIGN KEY (  perfil_codigo  ) REFERENCES   perfil   (  codigo  );
COMMIT;