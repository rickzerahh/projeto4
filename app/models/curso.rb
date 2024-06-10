class Curso < ApplicationRecord
    has_many :contems
    has_many :disciplinas, through: :contems
  end