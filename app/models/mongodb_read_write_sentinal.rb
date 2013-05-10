require 'mongo'
include Mongo

class MongodbReadWriteSentinal < Sentinal
  attr_accessor :host, :port, :database

  def run
    # Temporary until we hook up form -> database values 
    self.host = 'localhost'
    self.port = 27017
    self.database = 'sample-db'
    
    random = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
    collection_name = "test-write-#{random}"

    mongo = MongoClient.new(self.host, self.port, :w => 1)
    db = mongo[self.database]
    collection = db[collection_name]

    collection.remove
    100.times { collection.insert({"name" => "ok"}) }
    document_count = collection.count
    collection.remove

    result = Result.where(sentinal_id: self.id).first_or_initialize
    result.run_at = Time.now
    result.successful = (document_count == 100)
    result.save
  end
end
