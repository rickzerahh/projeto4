class Aluno < ApplicationRecord
    has_many :nota_aluno_disciplinas
    has_many :disciplinas, through: :nota_aluno_disciplinas
  end