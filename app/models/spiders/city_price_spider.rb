
module Spiders
  class CityPriceSpider < Spiders::ApplicationSpider
  @name = "CityPriceSpider"
  @start_urls = ["https://fangjia.fang.com/fangjia/common/ajaxdetailtrenddata/zz?dataType=city&showtitle=1&year=2"]

  @config = {
     headers: {
      #  'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0',
      #                  'Accept': '*/*',
      #                  'Connection': 'keep-alive',
      #                  'Accept-Language': 'zh-CN,zh;q=0.8'
    },
    delay: 1..10
  }

def parse(response, url:, data: {})
  logger.info response
  body = response.xpath("//body").text
  
  logger.info body
  json = body.split("&")
  JSON.parse(json[0]).each do |price|
                ::CityPrice.find_or_create_by({
                    time: Time.at(price.first.to_i / 1000),
                    price: price.last
                })
            end
  end
end

end