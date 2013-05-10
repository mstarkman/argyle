class Sentinal < ActiveRecord::Base
  validates_presence_of :name

  def run
  end
end
