class ArchiveJxlProxyJob < ApplicationJob
    queue_as :archive_jxl_proxy_job

    def perform
        Spiders::FreeJiangxianliIpSpider.crawl!
      rescue => e
        Rails.logger.error e
        return false
    end
  end