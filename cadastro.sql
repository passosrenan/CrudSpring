-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Fev-2022 às 20:55
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cadastro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cadastro`
--
CREATE DATABASE cadastro;
USE DATABASE cadastro;
CREATE TABLE `tb_cadastro` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dataCadastro` datetime DEFAULT NULL,
  `genero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_cadastro`
--

INSERT INTO `tb_cadastro` (`id`, `nome`, `endereco`, `nascimento`, `telefone`, `email`, `dataCadastro`, `genero`) VALUES
(27, 'Leandro', 'rua', '2022-02-07', '5165118', 'leandrorvian56@gmail.com', '2022-02-24 16:49:09', 'Masculino'),
(28, 'Bolacha', 'rua', '2022-02-17', '65585284', 'leandrorvian56@gmail.com', '2022-02-24 16:56:42', 'Feminino'),
(29, 'Suco', 'rua', '2022-02-26', '874516', 'leandrorvian56@gmail.com', '2022-02-24 16:57:08', 'Feminino'),
(30, 'Leandro', 'rua', '2022-02-15', '4343245', 'leandrorvian56@gmail.com', '2022-02-25 14:10:15', 'Feminino'),
(31, 'Leandro', 'rua', '2022-02-02', '16515', 'leandrorvian56@gmail.com', '2022-02-25 14:40:36', 'Masculino'),
(32, 'Leandro', 'rua', '2022-02-26', '5984949', 'leandrorvian56@gmail.com', '2022-02-25 14:54:41', 'Masculino');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_cadastro`
--
ALTER TABLE `tb_cadastro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_cadastro`
--
ALTER TABLE `tb_cadastro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
