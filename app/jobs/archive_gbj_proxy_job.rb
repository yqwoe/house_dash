class ArchiveGbjProxyJob < ApplicationJob
    queue_as :archive_gbj_proxy_job

    def perform
        Spiders::FreeGbjIpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end