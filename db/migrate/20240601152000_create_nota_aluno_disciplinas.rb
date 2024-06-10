class CreateNotaAlunoDisciplinas < ActiveRecord::Migration[7.0]
    def change
      create_table :nota_aluno_disciplinas do |t|
        t.references :aluno, foreign_key: true
        t.references :disciplina, foreign_key: true
        t.decimal :nota, precision: 3, scale: 2
  
        t.timestamps
      end
    end
  end
  