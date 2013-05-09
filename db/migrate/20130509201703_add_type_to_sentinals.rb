class AddTypeToSentinals < ActiveRecord::Migration
  def change
    add_column :sentinals, :type, :string
  end
end
