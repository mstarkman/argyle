class AddMongodbReadOnlyFieldsToSentinals < ActiveRecord::Migration
  def change
    add_column :sentinals, :host, :string
    add_column :sentinals, :port, :string
    add_column :sentinals, :database, :string
    add_column :sentinals, :collection, :string
    add_column :sentinals, :document_count, :integer
  end
end
