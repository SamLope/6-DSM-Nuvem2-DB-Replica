CREATE DATABASE IF NOT EXISTS `aula-db`;
USE `aula-db`;

CREATE TABLE IF NOT EXISTS produto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(50) NOT NULL,
  categoria VARCHAR(10) NOT NULL,
  valor NUMERIC(15,2) NOT NULL,
  criado_em DATETIME DEFAULT NOW(),
  criado_por VARCHAR(20) NOT NULL,
  UNIQUE(descricao, criado_por)
);

-- Usuário de replicação
CREATE USER IF NOT EXISTS 'replicador'@'%' IDENTIFIED BY 'senha123';
GRANT REPLICATION SLAVE ON *.* TO 'replicador'@'%';
FLUSH PRIVILEGES;
