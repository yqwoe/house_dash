

require 'rchardet19'
module Spiders
  class FreeXilaIpSpider < Spiders::ApplicationSpider
  @name = "FreeXilaIpSpider"
  @start_urls = ['http://www.xiladaili.com/putong/',
                "http://www.xiladaili.com/gaoni/",
                "http://www.xiladaili.com/http/",
                "http://www.xiladaili.com/https/"]

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
  # response.encoding = 'utf-8'
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
          
          host = t.xpath("./td[1]").text.strip

          ip = host.split(":")[0]
          port = host.split(":")[1]

          text = t.xpath("./td[2]").text

          protocol = text.gsub(/代理/,"").split(",")[0]



          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end

    rescue => e
        Rails.logger.error e
      end
end

end