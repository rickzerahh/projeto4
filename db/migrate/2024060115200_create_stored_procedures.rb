class CreateStoredProcedures < ActiveRecord::Migration[6.0]
    def up
      execute <<-SQL
        #{File.read(Rails.root.join('db', 'migrate', 'sql', 'stored_procedures.sql'))}
      SQL
    end
  
    def down
      execute <<-SQL
        DROP PROCEDURE IF EXISTS calcular_total_vendas_livro;
        DROP PROCEDURE IF EXISTS atualizar_preco_livros_autor;
      SQL
    end
  end