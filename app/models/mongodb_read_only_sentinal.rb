require 'mongo'
include Mongo

class MongodbReadOnlySentinal < Sentinal
  def run
    mongo     = MongoClient.new('localhost', 27017)
    db            = mongo['sample-db']
    collection = db['test']

    result = Result.new
    result.sentinal     = self
    result.run_at       = DateTime.new
    result.successful = collection.count > 0
    result.save
  end
end
