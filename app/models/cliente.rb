class Cliente < ApplicationRecord
    has_many :pagamentos
    has_many :pedidos
    has_many :relacionas
  end