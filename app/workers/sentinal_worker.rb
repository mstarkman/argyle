class SentinalWorker
  include Sidekiq::Worker

  def perform(id)
    Sentinal.find(id).run
  end
end
