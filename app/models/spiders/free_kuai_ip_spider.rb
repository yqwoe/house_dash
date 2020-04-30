module Spiders
  class FreeKuaiIpSpider < Spiders::ApplicationSpider
  @name = "FreeKuaiIpSpider"
  @start_urls = ['https://www.kuaidaili.com/free/inha/',
            'https://www.kuaidaili.com/free/intr/']

  @config = {
     headers: {
       'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0',
                       'Accept': '*/*',
                       'Connection': 'keep-alive',
                       'Accept-Language': 'zh-CN,zh;q=0.8'
    },
    encoding: nil,
    delay: 1..10
  }

def parse(response, url:, data: {})
        tr = response.xpath("//tbody/tr")
        ips = []
        # logger.info response.xpath("//tbody/tr")
        tr.each_with_index do |t,index|
          # next if index == 0
          
          ip = t.xpath("./td[@data-title='IP']").text
          port = t.xpath("./td[@data-title='PORT']").text

          protocol = t.xpath("./td[@data-title='类型']").text

          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end

    rescue => e
        Rails.logger.error e
      end
end
  
end