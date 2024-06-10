class CreateRelacionas < ActiveRecord::Migration[7.0]
    def change
      create_table :relacionas do |t|
        t.references :cliente, foreign_key: true
        t.integer :ref_pessoa
  
        t.timestamps
      end
    end
  end