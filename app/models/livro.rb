class Livro < ApplicationRecord
    belongs_to :biblioteca
    belongs_to :autor
    has_many :compras
    has_many :pedidos, through: :compras
  end