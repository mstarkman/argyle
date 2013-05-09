class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :monitor, index: true
      t.datetime :run_at
      t.boolean :successful

      t.timestamps
    end
  end
end
