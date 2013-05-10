require 'mongo'
include Mongo

class MongodbReadOnlySentinal < Sentinal
  validates_presence_of :host, :port, :database, :collection, :document_count

  def run
    mongo = MongoClient.new(self.host, self.port)
    db = mongo[self.database]
    collection = db[self.collection]

    result = Result.where(sentinal_id: self.id).first_or_initialize
    result.run_at = Time.now
    result.successful = (collection.count == self.document_count)
    result.save
  end
end
