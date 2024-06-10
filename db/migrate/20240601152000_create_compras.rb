class CreateCompras < ActiveRecord::Migration[7.0]
    def change
      create_table :compras do |t|
        t.references :pedido, foreign_key: true
        t.references :livro, foreign_key: true
        t.integer :qtt_vendas
  
        t.timestamps
      end
    end
  end