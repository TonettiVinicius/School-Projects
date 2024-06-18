
--
-- Banco de dados:  bd_hospitalar 
--

-- --------------------------------------------------------

--
-- Estrutura para tabela  capitulo_cid10 
--

CREATE TABLE  capitulo_cid10  (
   COD_CAPITULO_CID10  int(11) NOT NULL,
   SGL_CAPITULO_CID10  varchar(10) DEFAULT NULL,
   DSC_CAPITULO_CID10  varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  cid10 
--

CREATE TABLE  cid10  (
   COD_CID10  int(11) NOT NULL,
   SGL_CID10  varchar(10) DEFAULT NULL,
   DSC_CID10  varchar(400) DEFAULT NULL,
   COD_CAPITULO_CID10  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  cidade 
--

CREATE TABLE  cidade  (
   COD_CIDADE  int(11) NOT NULL,
   NOM_CIDADE  varchar(100) DEFAULT NULL,
   SGL_ESTADO  varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  consulta 
--

CREATE TABLE  consulta  (
   NUM_CONSULTA  int(11) NOT NULL,
   DATA_CONSULTA  datetime DEFAULT NULL,
   DSC_DIAGNOSTICO  varchar(255) DEFAULT NULL,
   DSC_ANALISE_CLINICA  varchar(255) DEFAULT NULL,
   CRM_MEDICO  int(11) DEFAULT NULL,
   COD_PACIENTE  int(11) DEFAULT NULL,
   COD_CID10  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  departamento 
--

CREATE TABLE  departamento  (
   COD_DEPARTAMENTO  int(11) NOT NULL,
   NOM_DEPARTAMENTO  varchar(100) DEFAULT NULL,
   IDF_ATIVO  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  enfermarie 
--

CREATE TABLE  enfermarie  (
   COD_ENFERMARIA  int(11) NOT NULL,
   NOM_ENFERMARIA  varchar(150) DEFAULT NULL,
   NUM_ANDAR_ENFERMARIA  int(11) DEFAULT NULL,
   IDF_ATIVO  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  especialidade 
--

CREATE TABLE  especialidade  (
   COD_ESPECIALIDADE  int(11) NOT NULL,
   NOM_ESPECIALIDADE  varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  especialidade_enfermaria 
--

CREATE TABLE  especialidade_enfermaria  (
   SEQ_ESPECIALIDADE_ENFERMARIA  int(11) NOT NULL,
   COD_ENFERMARIA  int(11) DEFAULT NULL,
   COD_ESPECIALIDADE  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  especialidade_medico 
--

CREATE TABLE  especialidade_medico  (
   SEQ_ESPECIALIDADE_MEDICO  int(11) NOT NULL,
   CRM_MEDICO  int(11) DEFAULT NULL,
   COD_ESPECIALIDADE  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  faixa_etaria 
--

CREATE TABLE  faixa_etaria  (
   SEQ_FAIXA_ETARIA  int(11) NOT NULL,
   DSC_FAIXA_ETARIA  varchar(100) DEFAULT NULL,
   NUM_IDADE_INICIO_FAIXA_ETARIA  int(11) DEFAULT NULL,
   NUM_IDADE_FIM_FAIXA_ETARIA  int(11) DEFAULT NULL,
   IDF_ATIVO  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  internacao 
--

CREATE TABLE  internacao  (
   NUM_INTERNACAO  int(11) NOT NULL,
   DATA_HORA_INTERNACAO  datetime DEFAULT NULL,
   DATA_HORA_ALTA  datetime DEFAULT NULL,
   NUM_LEITO  int(11) DEFAULT NULL,
   COD_PACIENTE  int(11) DEFAULT NULL,
   COD_CID10  int(11) DEFAULT NULL,
   CRM_MEDICO_SOLICITOU_INT  int(11) DEFAULT NULL,
   CRM_MEDICO_LIBEROU_ALTA  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  laboratorio 
--

CREATE TABLE  laboratorio  (
   COD_LABORATORIO  int(11) NOT NULL,
   NOM_LABORATORIO  varchar(150) DEFAULT NULL,
   COD_CIDADE  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  leito 
--

CREATE TABLE  leito  (
   NUM_LEITO  int(11) NOT NULL,
   IDF_SITUACAO  varchar(1) DEFAULT NULL,
   COD_ENFERMARIA  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  medicamento 
--

CREATE TABLE  medicamento  (
   COD_MEDICAMENTO  int(11) NOT NULL,
   NOM_MEDICAMENTO  varchar(150) DEFAULT NULL,
   NCM_MEDICAMENTO  varchar(150) DEFAULT NULL,
   APS_MEDICAMENTO  varchar(150) DEFAULT NULL,
   DSC_MEDICAMENTO  varchar(150) DEFAULT NULL,
   COD_LABORATORIO  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  medico 
--

CREATE TABLE  medico  (
   CRM_MEDICO  int(11) NOT NULL,
   NOM_MEDICO  varchar(100) DEFAULT NULL,
   IDF_SEXO  varchar(1) DEFAULT NULL,
   DTA_NASCIMENTO  date DEFAULT NULL,
   COD_DEPARTAMENTO  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  paciente 
--

CREATE TABLE  paciente  (
   COD_PACIENTE  int(11) NOT NULL,
   NOM_PACIENTE  varchar(150) DEFAULT NULL,
   END_PACIENTE  varchar(150) DEFAULT NULL,
   IDF_SEXO  varchar(1) DEFAULT NULL,
   DTA_NASCIMENTO  date DEFAULT NULL,
   COD_CIDADE  int(11) DEFAULT NULL,
   SEQ_FAIXA_ETARIA  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  prescricao 
--

CREATE TABLE  prescricao  (
   SEQ_PRESCRICAO  int(11) NOT NULL,
   DSC_ORIENTACOES  varchar(150) DEFAULT NULL,
   DSC_DOSAGEM  varchar(150) DEFAULT NULL,
   DSC_APRESENTACAO  varchar(150) DEFAULT NULL,
   NUM_RECEITA  int(11) DEFAULT NULL,
   COD_MEDICAMENTO  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  receita 
--

CREATE TABLE  receita  (
   NUM_RECEITA  int(11) NOT NULL,
   DATA_RECEITA  datetime DEFAULT NULL,
   DSC_ORIENTACOES_GERAIS  varchar(255) DEFAULT NULL,
   NUM_CONSULTA  int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela  telefone_paciente 
--

CREATE TABLE  telefone_paciente  (
   COD_PACIENTE  int(11) DEFAULT NULL,
   NUM_TELEFONE_PACIENTE  varchar(16) DEFAULT NULL,
   IDF_TIPO_TELEFONE_PACIENTE  varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela  capitulo_cid10 
--
ALTER TABLE  capitulo_cid10 
  ADD PRIMARY KEY ( COD_CAPITULO_CID10 );

--
-- Índices de tabela  cid10 
--
ALTER TABLE  cid10 
  ADD PRIMARY KEY ( COD_CID10 ),
  ADD KEY  COD_CAPITULO_CID10  ( COD_CAPITULO_CID10 );

--
-- Índices de tabela  cidade 
--
ALTER TABLE  cidade 
  ADD PRIMARY KEY ( COD_CIDADE );

--
-- Índices de tabela  consulta 
--
ALTER TABLE  consulta 
  ADD PRIMARY KEY ( NUM_CONSULTA ),
  ADD KEY  CRM_MEDICO  ( CRM_MEDICO ),
  ADD KEY  COD_PACIENTE  ( COD_PACIENTE ),
  ADD KEY  COD_CID10  ( COD_CID10 );

--
-- Índices de tabela  departamento 
--
ALTER TABLE  departamento 
  ADD PRIMARY KEY ( COD_DEPARTAMENTO );

--
-- Índices de tabela  enfermarie 
--
ALTER TABLE  enfermarie 
  ADD PRIMARY KEY ( COD_ENFERMARIA );

--
-- Índices de tabela  especialidade 
--
ALTER TABLE  especialidade 
  ADD PRIMARY KEY ( COD_ESPECIALIDADE );

--
-- Índices de tabela  especialidade_enfermaria 
--
ALTER TABLE  especialidade_enfermaria 
  ADD PRIMARY KEY ( SEQ_ESPECIALIDADE_ENFERMARIA ),
  ADD KEY  COD_ENFERMARIA  ( COD_ENFERMARIA ),
  ADD KEY  COD_ESPECIALIDADE  ( COD_ESPECIALIDADE );

--
-- Índices de tabela  especialidade_medico 
--
ALTER TABLE  especialidade_medico 
  ADD PRIMARY KEY ( SEQ_ESPECIALIDADE_MEDICO ),
  ADD KEY  CRM_MEDICO  ( CRM_MEDICO ),
  ADD KEY  COD_ESPECIALIDADE  ( COD_ESPECIALIDADE );

--
-- Índices de tabela  faixa_etaria 
--
ALTER TABLE  faixa_etaria 
  ADD PRIMARY KEY ( SEQ_FAIXA_ETARIA );

--
-- Índices de tabela  internacao 
--
ALTER TABLE  internacao 
  ADD PRIMARY KEY ( NUM_INTERNACAO ),
  ADD KEY  NUM_LEITO  ( NUM_LEITO ),
  ADD KEY  COD_PACIENTE  ( COD_PACIENTE ),
  ADD KEY  COD_CID10  ( COD_CID10 ),
  ADD KEY  CRM_MEDICO_SOLICITOU_INT  ( CRM_MEDICO_SOLICITOU_INT ),
  ADD KEY  CRM_MEDICO_LIBEROU_ALTA  ( CRM_MEDICO_LIBEROU_ALTA );

--
-- Índices de tabela  laboratorio 
--
ALTER TABLE  laboratorio 
  ADD PRIMARY KEY ( COD_LABORATORIO ),
  ADD KEY  COD_CIDADE  ( COD_CIDADE );

--
-- Índices de tabela  leito 
--
ALTER TABLE  leito 
  ADD PRIMARY KEY ( NUM_LEITO ),
  ADD KEY  COD_ENFERMARIA  ( COD_ENFERMARIA );

--
-- Índices de tabela  medicamento 
--
ALTER TABLE  medicamento 
  ADD PRIMARY KEY ( COD_MEDICAMENTO ),
  ADD KEY  COD_LABORATORIO  ( COD_LABORATORIO );

--
-- Índices de tabela  medico 
--
ALTER TABLE  medico 
  ADD PRIMARY KEY ( CRM_MEDICO ),
  ADD KEY  COD_DEPARTAMENTO  ( COD_DEPARTAMENTO );

--
-- Índices de tabela  paciente 
--
ALTER TABLE  paciente 
  ADD PRIMARY KEY ( COD_PACIENTE ),
  ADD KEY  COD_CIDADE  ( COD_CIDADE ),
  ADD KEY  SEQ_FAIXA_ETARIA  ( SEQ_FAIXA_ETARIA );

--
-- Índices de tabela  prescricao 
--
ALTER TABLE  prescricao 
  ADD PRIMARY KEY ( SEQ_PRESCRICAO ),
  ADD KEY  NUM_RECEITA  ( NUM_RECEITA ),
  ADD KEY  COD_MEDICAMENTO  ( COD_MEDICAMENTO );

--
-- Índices de tabela  receita 
--
ALTER TABLE  receita 
  ADD PRIMARY KEY ( NUM_RECEITA ),
  ADD KEY  NUM_CONSULTA  ( NUM_CONSULTA );

--
-- Índices de tabela  telefone_paciente 
--
ALTER TABLE  telefone_paciente 
  ADD KEY  COD_PACIENTE  ( COD_PACIENTE );

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas  cid10 
--
ALTER TABLE  cid10 
  ADD CONSTRAINT  cid10_ibfk_1  FOREIGN KEY ( COD_CAPITULO_CID10 ) REFERENCES  capitulo_cid10  ( COD_CAPITULO_CID10 );

--
-- Restrições para tabelas  consulta 
--
ALTER TABLE  consulta 
  ADD CONSTRAINT  consulta_ibfk_1  FOREIGN KEY ( CRM_MEDICO ) REFERENCES  medico  ( CRM_MEDICO ),
  ADD CONSTRAINT  consulta_ibfk_2  FOREIGN KEY ( COD_PACIENTE ) REFERENCES  paciente  ( COD_PACIENTE ),
  ADD CONSTRAINT  consulta_ibfk_3  FOREIGN KEY ( COD_CID10 ) REFERENCES  cid10  ( COD_CID10 );

--
-- Restrições para tabelas  especialidade_enfermaria 
--
ALTER TABLE  especialidade_enfermaria 
  ADD CONSTRAINT  especialidade_enfermaria_ibfk_1  FOREIGN KEY ( COD_ENFERMARIA ) REFERENCES  enfermarie  ( COD_ENFERMARIA ),
  ADD CONSTRAINT  especialidade_enfermaria_ibfk_2  FOREIGN KEY ( COD_ESPECIALIDADE ) REFERENCES  especialidade  ( COD_ESPECIALIDADE );

--
-- Restrições para tabelas  especialidade_medico 
--
ALTER TABLE  especialidade_medico 
  ADD CONSTRAINT  especialidade_medico_ibfk_1  FOREIGN KEY ( CRM_MEDICO ) REFERENCES  medico  ( CRM_MEDICO ),
  ADD CONSTRAINT  especialidade_medico_ibfk_2  FOREIGN KEY ( COD_ESPECIALIDADE ) REFERENCES  especialidade  ( COD_ESPECIALIDADE );

--
-- Restrições para tabelas  internacao 
--
ALTER TABLE  internacao 
  ADD CONSTRAINT  internacao_ibfk_1  FOREIGN KEY ( NUM_LEITO ) REFERENCES  leito  ( NUM_LEITO ),
  ADD CONSTRAINT  internacao_ibfk_2  FOREIGN KEY ( COD_PACIENTE ) REFERENCES  paciente  ( COD_PACIENTE ),
  ADD CONSTRAINT  internacao_ibfk_3  FOREIGN KEY ( COD_CID10 ) REFERENCES  cid10  ( COD_CID10 ),
  ADD CONSTRAINT  internacao_ibfk_4  FOREIGN KEY ( CRM_MEDICO_SOLICITOU_INT ) REFERENCES  medico  ( CRM_MEDICO ),
  ADD CONSTRAINT  internacao_ibfk_5  FOREIGN KEY ( CRM_MEDICO_LIBEROU_ALTA ) REFERENCES  medico  ( CRM_MEDICO );

--
-- Restrições para tabelas  laboratorio 
--
ALTER TABLE  laboratorio 
  ADD CONSTRAINT  laboratorio_ibfk_1  FOREIGN KEY ( COD_CIDADE ) REFERENCES  cidade  ( COD_CIDADE );

--
-- Restrições para tabelas  leito 
--
ALTER TABLE  leito 
  ADD CONSTRAINT  leito_ibfk_1  FOREIGN KEY ( COD_ENFERMARIA ) REFERENCES  enfermarie  ( COD_ENFERMARIA );

--
-- Restrições para tabelas  medicamento 
--
ALTER TABLE  medicamento 
  ADD CONSTRAINT  medicamento_ibfk_1  FOREIGN KEY ( COD_LABORATORIO ) REFERENCES  laboratorio  ( COD_LABORATORIO );

--
-- Restrições para tabelas  medico 
--
ALTER TABLE  medico 
  ADD CONSTRAINT  medico_ibfk_1  FOREIGN KEY ( COD_DEPARTAMENTO ) REFERENCES  departamento  ( COD_DEPARTAMENTO );

--
-- Restrições para tabelas  paciente 
--
ALTER TABLE  paciente 
  ADD CONSTRAINT  paciente_ibfk_1  FOREIGN KEY ( COD_CIDADE ) REFERENCES  cidade  ( COD_CIDADE ),
  ADD CONSTRAINT  paciente_ibfk_2  FOREIGN KEY ( SEQ_FAIXA_ETARIA ) REFERENCES  faixa_etaria  ( SEQ_FAIXA_ETARIA );

--
-- Restrições para tabelas  prescricao 
--
ALTER TABLE  prescricao 
  ADD CONSTRAINT  prescricao_ibfk_1  FOREIGN KEY ( NUM_RECEITA ) REFERENCES  receita  ( NUM_RECEITA ),
  ADD CONSTRAINT  prescricao_ibfk_2  FOREIGN KEY ( COD_MEDICAMENTO ) REFERENCES  medicamento  ( COD_MEDICAMENTO );

--
-- Restrições para tabelas  receita 
--
ALTER TABLE  receita 
  ADD CONSTRAINT  receita_ibfk_1  FOREIGN KEY ( NUM_CONSULTA ) REFERENCES  consulta  ( NUM_CONSULTA );

--
-- Restrições para tabelas  telefone_paciente 
--
ALTER TABLE  telefone_paciente 
  ADD CONSTRAINT  telefone_paciente_ibfk_1  FOREIGN KEY ( COD_PACIENTE ) REFERENCES  paciente  ( COD_PACIENTE );
COMMIT;
