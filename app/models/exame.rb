class Exame < ApplicationRecord
    belongs_to :disciplina
    belongs_to :professor
  end