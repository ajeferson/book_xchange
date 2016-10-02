class EvaluationsAddId < ActiveRecord::Migration

  def change

    execute('ALTER TABLE evaluations ADD COLUMN id serial NOT NULL')

    evaluations = Evaluation.all
    evaluations.each_with_index do |evaluation, index|
      evaluation.update(id: index + 1)
    end

  end

end
