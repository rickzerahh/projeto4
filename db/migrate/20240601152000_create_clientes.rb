class CreateClientes < ActiveRecord::Migration[7.0]
    def change
      create_table :clientes do |t|
        t.string :nome_cliente
        t.string :email_cliente
        t.integer :ref_pessoa
  
        t.timestamps
      end
    end
  end