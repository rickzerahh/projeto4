class CreateUpdateStockTrigger < ActiveRecord::Migration[6.0]
    def change
      create_trigger(:itens_pedidos, :after, :insert) do
        "UPDATE livros SET estoque = estoque - NEW.quantidade WHERE id = NEW.livro_id;"
      end
    end
  end