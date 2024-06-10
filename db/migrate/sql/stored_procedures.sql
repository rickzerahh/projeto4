DELIMITER / /

CREATE PROCEDURE calcular_total_vendas_livro(IN livro_id INT, OUT total_vendas INT)
BEGIN
    SELECT SUM(quantidade) INTO total_vendas
    FROM itens_pedidos
    WHERE livro_id = livro_id;
END //

CREATE PROCEDURE atualizar_preco_livros_autor(IN autor_id INT, IN percentual FLOAT)
BEGIN
    UPDATE livros
    SET valor_livro = valor_livro + (valor_livro * percentual / 100)
    WHERE autor_id = autor_id;
END //

DELIMITER;