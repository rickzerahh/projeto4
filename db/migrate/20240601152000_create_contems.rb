class CreateContems < ActiveRecord::Migration[7.0]
    def change
      create_table :contems do |t|
        t.references :curso, foreign_key: true
        t.references :disciplina, foreign_key: true
  
        t.timestamps
      end
    end
  end