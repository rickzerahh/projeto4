class CreateTrabFuncs < ActiveRecord::Migration[7.0]
    def change
      create_table :trab_funcs do |t|
        t.references :funcionario, foreign_key: true
        t.references :biblioteca, foreign_key: true
  
        t.timestamps
      end
    end
  end