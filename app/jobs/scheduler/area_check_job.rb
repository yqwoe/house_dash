module Scheduler
  class AreaCheckJob < ApplicationJob
    queue_as :area_check_job

    def perform
        Spiders::AreaCheckSpider.crawl!
    end
  end
end