class EvaluationsChangePkey < ActiveRecord::Migration
  def change
    execute('ALTER TABLE evaluations DROP CONSTRAINT evaluations_pkey')
    execute('ALTER TABLE evaluations ADD PRIMARY KEY (id)')
  end
end
