class SentinalWorker
  include Sidekiq::Worker

  def perform(id)
    puts Sentinal.find(id).type
  end
end
