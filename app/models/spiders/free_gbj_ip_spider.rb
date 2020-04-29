module Spiders
  class FreeGbjIpSpider < Spiders::ApplicationSpider
  @name = "FreeGbjIpSpider"
  @start_urls = ["http://www.goubanjia.com/"]

def parse(response, url:, data: {})
        tr = response.xpath("//tbody/tr")
        ips = []
        # logger.info response.xpath("//tbody/tr")
        tr.each_with_index do |t,index|
          ip = t.xpath("./td[1]//*[not(contains(@style, 'display: none'))
                                        and not(contains(@style, 'display:none'))
                                        and not(contains(@class, 'port'))
                                        ]/text()").text
          
          # ip = host.split(":")[0]
          port = t.xpath("./td[1]//span[contains(@class, 'port')]").text
          # p port
          protocol = t.xpath("./td[3]").text
          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end


    end
end
  
end