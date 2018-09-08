class CrawlerWorker
  include Sidekiq::Worker

  def perform(instance_url, id)
    Instance.find_by(url: instance_url).update(is_crawling: true)
    MemoCrawler.crawl(instance_url, id)
    Instance.find_by(url: instance_url).update(is_crawling: false, last_crawl: Time.current)
  end
end
