class CreateBibliotecas < ActiveRecord::Migration[7.0]
    def change
      create_table :bibliotecas do |t|
        t.string :telefone_biblioteca
  
        t.timestamps
      end
    end
  end
  