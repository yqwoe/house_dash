class ArchiveKuaiProxyJob < ApplicationJob
    queue_as :archive_kuai_proxy_job

    def perform
        Spiders::FreeKuaiIpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end