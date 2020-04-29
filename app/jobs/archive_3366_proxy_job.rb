class Archive3366ProxyJob < ApplicationJob
    queue_as :archive_3366_proxy_job

    def perform
        Spiders::Free3366IpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end