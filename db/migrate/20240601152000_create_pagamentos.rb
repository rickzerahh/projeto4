class CreatePagamentos < ActiveRecord::Migration[7.0]
    def change
      create_table :pagamentos do |t|
        t.string :forma_pagamento
        t.decimal :valor_pagamento, precision: 10, scale: 2
        t.date :data_pagamento
        t.references :cliente, foreign_key: true
  
        t.timestamps
      end
    end
  end
  