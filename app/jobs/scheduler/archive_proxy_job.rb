module Scheduler
  class ArchiveProxyJob < ApplicationJob
    queue_as :archive_proxy_job

    def perform
        # Rails.logger.debug 'archive_proxy_job'
        Spiders::FreeXiciIpSpider.crawl!
        Spiders::FreeGbjIpSpider.crawl!
        Spiders::FreeKuaiIpSpider.crawl!
        Spiders::Free3366IpSpider.crawl!
        Spiders::Free66IpSpider.crawl!
        Spiders::FreeJiangxianliIpSpider.crawl!
        Spiders::FreeXilaIpSpider.crawl!
        Spiders::Free89IpSpider.crawl!
        Spiders::FreeQyIpSpider.crawl!
        # Spiders::FreeIpHaiSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end
end