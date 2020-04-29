class ArchiveXiciProxyJob < ApplicationJob
    queue_as :archive_xici_proxy_job

    def perform
        Spiders::FreeXiciIpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end