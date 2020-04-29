class ArchiveQyProxyJob < ApplicationJob
    queue_as :archive_qy_proxy_job

    def perform
        Spiders::FreeQyIpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end