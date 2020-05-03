module Scheduler
  class CityPriceJob < ApplicationJob
    queue_as :city_price

    def perform
        Spiders::CityPriceSpider.crawl!
    end
  end
end