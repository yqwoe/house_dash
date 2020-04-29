class Archive89ProxyJob < ApplicationJob
    queue_as :archive_89_proxy_job

    def perform
        Spiders::Free89IpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end