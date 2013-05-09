class CreateSentinals < ActiveRecord::Migration
  def change
    create_table :sentinals do |t|
      t.string :name

      t.timestamps
    end
  end
end
