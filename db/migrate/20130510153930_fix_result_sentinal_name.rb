class FixResultSentinalName < ActiveRecord::Migration
  def change
    rename_column :results, :monitor_id, :sentinal_id
  end
end
