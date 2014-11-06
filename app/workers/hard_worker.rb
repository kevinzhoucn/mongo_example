# app/workers/hard_worker.rb
class HardWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform(name, count)
    puts 'Doing hard work'
  end
end