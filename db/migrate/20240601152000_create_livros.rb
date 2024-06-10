class CreateLivros < ActiveRecord::Migration[7.0]
    def change
      create_table :livros do |t|
        t.integer :ISBN, primary_key: true
        t.integer :ano_lancamento
        t.string :edicao
        t.string :titulo_livro
        t.string :editora
        t.integer :qtt_vendas
        t.integer :qtt_emprestimo
        t.decimal :valor_livro, precision: 10, scale: 2
        t.string :tipo_livro
        t.references :biblioteca, foreign_key: true
        t.references :autor, foreign_key: true
  
        t.timestamps
      end
    end
  end