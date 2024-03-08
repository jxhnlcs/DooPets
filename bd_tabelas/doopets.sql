/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS animais;
CREATE TABLE `animais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pet` varchar(200) DEFAULT NULL,
  `data_nascimento` varchar(20) DEFAULT NULL,
  `sexo` varchar(2) DEFAULT NULL,
  `altura` varchar(20) DEFAULT NULL,
  `peso` varchar(20) DEFAULT NULL,
  `especie` varchar(20) DEFAULT NULL,
  `raca` varchar(50) DEFAULT NULL,
  `pelagem` varchar(25) DEFAULT NULL,
  `porte` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS cargos;
CREATE TABLE `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS clientes;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS cliente_animal;
CREATE TABLE `cliente_animal` (
  `cliente_id` int(11) NOT NULL,
  `animal_id` int(11) NOT NULL,
  PRIMARY KEY (`animal_id`,`cliente_id`),
  KEY `cliente_animal_ibfk_2` (`cliente_id`),
  CONSTRAINT `cliente_animal_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cliente_animal_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS fornecedores;
CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_fantasia` varchar(45) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS funcionarios;
CREATE TABLE `funcionarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `endereco` varchar(300) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS ordem_de_servico;
CREATE TABLE `ordem_de_servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_Inicio` date DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `funcionario_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_termino` time DEFAULT NULL,
  `duracao` varchar(100) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Aguardando atendimento',
  `data_Termino` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ordem_de_servico_ibfk_1` (`cliente_id`),
  KEY `ordem_de_servico_ibfk_2` (`animal_id`),
  KEY `ordem_de_servico_ibfk_3` (`funcionario_id`),
  KEY `ordem_de_servico_ibfk_4` (`servico_id`),
  CONSTRAINT `ordem_de_servico_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordem_de_servico_ibfk_2` FOREIGN KEY (`animal_id`) REFERENCES `animais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordem_de_servico_ibfk_3` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordem_de_servico_ibfk_4` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS produtos;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_validade` date NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL,
  `cod_barras` varchar(255) NOT NULL,
  `fornecedor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produtos_ibfk_1` (`fornecedor_id`),
  CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS produtos_venda;
CREATE TABLE `produtos_venda` (
  `venda_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade_vendida` int(11) DEFAULT NULL,
  KEY `produtos_venda_ibfk_1` (`venda_id`),
  KEY `produtos_venda_ibfk_2` (`produto_id`),
  CONSTRAINT `produtos_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `Vendas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `produtos_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS racas;
CREATE TABLE `racas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noma_raca` varchar(100) DEFAULT NULL,
  `especie` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS servicos;
CREATE TABLE `servicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_servico` varchar(200) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS servico_venda;
CREATE TABLE `servico_venda` (
  `venda_id` int(11) DEFAULT NULL,
  `servico_id` int(11) DEFAULT NULL,
  `quantidade_vendida` int(11) DEFAULT NULL,
  KEY `venda_id` (`venda_id`),
  KEY `servico_id` (`servico_id`),
  CONSTRAINT `servicos_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `Vendas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `servicos_venda_ibfk_2` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS tipo_pelagem;
CREATE TABLE `tipo_pelagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS tipo_porte;
CREATE TABLE `tipo_porte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `senhaAcesso` varchar(255) NOT NULL DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Vendas`;
CREATE TABLE `Vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `quantidade_produtos` int(11) DEFAULT NULL,
  `metodos_pagamento` text,
  `parcelas` varchar(3) DEFAULT NULL,
  `data_venda` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;