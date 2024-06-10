class CreateProfessors < ActiveRecord::Migration[7.0]
    def change
      create_table :professors do |t|
        t.string :nome_professor
        t.string :especializacao_professor
        t.decimal :salario_professor, precision: 10, scale: 2
  
        t.timestamps
      end
    end
  end