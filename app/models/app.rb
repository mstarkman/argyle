class App < ActiveRecord::Base
  validates_presence_of :name
  has_many :app_sentinals
  has_many :sentinals, through: :app_sentinals
end
