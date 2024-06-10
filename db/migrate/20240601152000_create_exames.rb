class CreateExames < ActiveRecord::Migration[7.0]
    def change
      create_table :exames do |t|
        t.references :disciplina, foreign_key: true
        t.references :professor, foreign_key: true
  
        t.timestamps
      end
    end
  end