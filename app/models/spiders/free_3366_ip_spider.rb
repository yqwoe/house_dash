

require 'rchardet19'
module Spiders
  class Free3366IpSpider < Spiders::ApplicationSpider
  @name = "Free3366IpSpider"
  @start_urls = ['http://www.ip3366.net/free/?stype=1',
                "http://www.ip3366.net/free/?stype=2"]

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
  encoding =response.meta_encoding
    html_str =  response.to_html
    html = Nokogiri::HTML(html_str,nil,encoding)
        tr = html.xpath("//tbody/tr")

        # ips = []
        # # logger.info response.xpath("//tbody/tr")
        # logger.info  response.to_s
        tr.each_with_index do |t,index|
          # next if index == 0
          
          ip = t.xpath("./td[1]").text
          port = t.xpath("./td[2]").text

          protocol = t.xpath("./td[4]").text

          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end

    rescue => e
        Rails.logger.error e
      end
end

end