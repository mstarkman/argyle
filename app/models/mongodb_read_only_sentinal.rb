require 'mongo'
include Mongo

class MongodbReadOnlySentinal < Sentinal
  attr_accessor :host, :port, :database, :collection, :document_count

  def run
    # Temporary until we hook up form -> database values 
    self.host = 'localhost'
    self.port = '27017'
    self.database = 'sample-db'
    self.collection = 'test'
    self.document_count = 2

    mongo = MongoClient.new(self.host, self.port)
    db = mongo[self.database]
    collection = db[self.collection]

    result = Result.where(sentinal_id: self.id).first_or_create
    result.run_at = Time.now
    result.successful = (collection.count == self.document_count)
    result.save
  end
end
