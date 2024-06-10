class Compra < ApplicationRecord
    belongs_to :pedido
    belongs_to :livro
  end
  