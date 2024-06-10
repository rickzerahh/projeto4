class Biblioteca < ApplicationRecord
    has_many :livros
    has_many :trab_funcs
    has_many :funcionarios, through: :trab_funcs
  end