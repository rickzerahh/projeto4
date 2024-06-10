class CreateAutors < ActiveRecord::Migration[7.0]
    def change
      create_table :autors do |t|
        t.date :data_nasc
        t.string :nacionalidade
        t.string :nome_autor
  
        t.timestamps
      end
    end
  end