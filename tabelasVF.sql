-----------------------------------------------------------------------------------------------------------
--TABELA DE VENDEDORES
--DROP TABLE VENDEDOR;
CREATE TABLE VENDEDOR(
	codVendedor SERIAL,
	codProduto INTEGER,
	nomeVendedor VARCHAR(100),
	cpfVendedor VARCHAR(25),
	rgVendedor VARCHAR(25),
	emailVendedor VARCHAR(100),
	ruaVendedor VARCHAR(100),
	numeroLocalVendedor INTEGER,
	bairroVendedor VARCHAR(50),
	cidadeVendedor VARCHAR(100),
	ufVendedor VARCHAR(2),
	cepVendedor VARCHAR(9),
	CONSTRAINT pk_codVendedor PRIMARY KEY (codVendedor),
	CONSTRAINT fk_produto_ofertado FOREIGN KEY (codProduto) REFERENCES produtos,
);
SELECT * FROM VENDEDOR;
-----------------------------------------------------------------------------------------------------------
--TABELA DE CLIENTES
--DROP TABLE CLIENTE;
CREATE TABLE CLIENTE (
	codCliente SERIAL,
	codVendedor INTEGER,
	codProduto INTEGER,
	nomeCliente VARCHAR(100),
	cpfCliente VARCHAR(15),
	rgCliente VARCHAR (15),
	cepCliente VARCHAR(9),
	ruaCliente VARCHAR(100),
	numeroLocalCliente INTEGER,
	bairroCliente VARCHAR(100),
	municipioCliente VARCHAR(100),
	ufCliente VARCHAR(2),
	emailCliente VARCHAR(100),
	saldoDevedorCliente NUMERIC,
	situacaoCliente VARCHAR(20),
	limiteCreditoCliente NUMERIC,
	tipoCliente VARCHAR(15),
	situaçãoCobrancaCliente VARCHAR(10),
	CONSTRAINT pk_codCliente PRIMARY KEY (codCliente),
	CONSTRAINT fk_produto_comprado FOREIGN KEY (codProduto) REFERENCES produtos,
	CONSTRAINT fk_venda_cliente_final FOREIGN KEY (codVendedor) REFERENCES vendedor
);
SELECT * FROM CLIENTE;

-----------------------------------------------------------------------------------------------------------
--TABELA DE FORNECEDORES
--DROP TABLE FORNECEDOR
CREATE TABLE FORNECEDOR(
	codFornecedor SERIAL,
	codProduto INTEGER,
	nomeFornecedor VARCHAR(100),
	nomeFantasiaFornecedor VARCHAR(100),
	ruaFornecedor VARCHAR(100),
	numeroLocalFornecedor INTEGER,
	bairroFornecedor VARCHAR(100),
	cidadeFornecedor VARCHAR(100),
	ufFornecedor VARCHAR(2),
	cepFornecedor VARCHAR(9),
	telefoneFornecedor VARCHAR(20),
	emailFornecedor VARCHAR(100),
	produtosFornecidos VARCHAR(500),
	--O campo de produtos fornecidos pode ser um campo de texto ou uma array,
	--não irá ser verificado em nota de entrada, pois o sistema terá apenas 
	--notas de saída
	CONSTRAINT pk_codFornecedor PRIMARY KEY (codFornecedor),
	CONSTRAINT fk_produto_fornecido FOREIGN KEY (codProduto) REFERENCES produtos,
);
SELECT * FROM FORNECEDOR;
-----------------------------------------------------------------------------------------------------------
--TABELA DE PRODUTOS
--DROP TABLE PRODUTOS
CREATE TABLE PRODUTOS(
	codProduto SERIAL,
	nomeProduto VARCHAR(100),
	precoProduto NUMERIC,
	dataDeValidade DATE,
	dataDeFabricacao DATE,
	quantidadeEstoque INTEGER,
	CONSTRAINT pk_codProduto PRIMARY KEY (codProduto),
	CONSTRAINT ck_estoque_produto CHECK (quantidadeEstoque > 0)
);
SELECT * FROM PRODUTOS;
-----------------------------------------------------------------------------------------------------------
