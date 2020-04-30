

require 'rchardet19'

require 'kimurai'
module Spiders
  class Free89IpSpider < Spiders::ApplicationSpider
  @name = "Free89IpSpider"
  @start_urls = ["http://www.89ip.cn/index_1.html","http://www.89ip.cn/index_2.html"]

  @config = {
     headers: {
      #  'User-Agent': 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:34.0) Gecko/20100101 Firefox/34.0',
      #                  'Accept': '*/*',
      #                  'Connection': 'keep-alive',
      #                  'Accept-Language': 'zh-CN,zh;q=0.8'
    },
    # encoding: 'gb2312',
    delay: 1..10
  }

def parse(response, url:, data: {})
  response.encoding = 'utf-8'
    # logger.info  "=============#{response}"
    # html = Nokogiri::HTML(html_str,nil,encoding)
    # html = Nokogiri::HTML(html_str,nil,'gbk')
    # logger.info  "=============#{html_str}"
        tr = response.xpath("//tbody/tr")

        # ips = []
        # logger.info response.xpath("//tbody/tr")
        # logger.info  response.to_s
        tr.each_with_index do |t,index|

          # next if index == 0
          
          ip = t.xpath("./td[1]").text.strip
          port = t.xpath("./td[2]").text.strip

          protocol = 'http'

          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end

    rescue => e
        Rails.logger.error e
      end
end

end