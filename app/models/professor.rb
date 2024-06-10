class Professor < ApplicationRecord
    has_many :exames
    has_many :disciplinas, through: :exames
  end