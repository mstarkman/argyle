class AddDescriptionToSentinals < ActiveRecord::Migration
  def change
    add_column :sentinals, :description, :text
  end
end
