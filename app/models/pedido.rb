class Pedido < ApplicationRecord
    belongs_to :cliente
    has_many :compras
    has_many :livros, through: :compras
  end
  