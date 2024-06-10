class CreateFuncionarios < ActiveRecord::Migration[7.0]
    def change
      create_table :funcionarios do |t|
        t.string :especificacao_funcionario
        t.string :nome_funcionario
        t.string :telefone_funcionario
  
        t.timestamps
      end
    end
  end
  