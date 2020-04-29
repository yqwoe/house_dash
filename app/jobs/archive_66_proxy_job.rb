class Archive66ProxyJob < ApplicationJob
  queue_as :archive_66_proxy_job
    def perform
        Spiders::Free66IpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
end