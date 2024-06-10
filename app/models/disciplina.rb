class Disciplina < ApplicationRecord
    has_many :contems
    has_many :cursos, through: :contems
    has_many :nota_aluno_disciplinas
    has_many :alunos, through: :nota_aluno_disciplinas
  end