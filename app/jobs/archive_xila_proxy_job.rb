class ArchiveXilaProxyJob < ApplicationJob
    queue_as :archive_xila_proxy_job

    def perform
        Spiders::FreeXilaIpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end