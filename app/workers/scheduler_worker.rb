class SchedulerWorker
  include Sidekiq::Worker

  def perform()
    Sentinal.find_each do |sentinal|
      SentinalWorker.perform_async(sentinal.id)
    end
  end
end
