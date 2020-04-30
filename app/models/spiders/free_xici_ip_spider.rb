module Spiders
  class FreeXiciIpSpider < Spiders::ApplicationSpider
  @name = "FreeXiciIpSpider"
  @start_urls = [
          "https://www.xicidaili.com/nn/1",
          "https://www.xicidaili.com/nn/2",
          "http://www.xicidaili.com/nt/1",
          "http://www.xicidaili.com/nt/2"

        
        ]

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
        tr = response.xpath("//table[@id='ip_list']/tr")
        ips = []
        # logger.info response.xpath("//table[@id='ip_list']/tr")
        tr.each_with_index do |t,index|
          next if index == 0
          
          ip = t.xpath("./td[2]").text
          port = t.xpath("./td[3]").text

          protocol = t.xpath("./td[6]").text

          # logger.info t.xpath("./td[7]")
          time =  t.xpath("./td[7]/div[@class='bar']")[0]["title"]
          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end

    rescue => e
        Rails.logger.error e

    end
end
  
end