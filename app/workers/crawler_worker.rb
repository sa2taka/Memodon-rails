class CrawlerWorker
  include Sidekiq::Worker

  def perform(instance_url, username)
    pp instance_url
  end
end
