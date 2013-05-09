class CreateAppSentinals < ActiveRecord::Migration
  def change
    create_table :app_sentinals do |t|
      t.references :app, index: true
      t.references :sentinal, index: true

      t.timestamps
    end
  end
end
