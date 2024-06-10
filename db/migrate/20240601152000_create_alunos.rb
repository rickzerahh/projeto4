class CreateAlunos < ActiveRecord::Migration[7.0]
    def change
      create_table :alunos do |t|
        t.integer :matricula_aluno, primary_key: true
        t.string :nome_aluno
        t.string :email_aluno
        t.string :endereco_aluno
  
        t.timestamps
      end
    end
  end