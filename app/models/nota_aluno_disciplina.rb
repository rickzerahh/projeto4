class NotaAlunoDisciplina < ApplicationRecord
    belongs_to :aluno
    belongs_to :disciplina
  end