

require 'rchardet19'
module Spiders
  class FreeJiangxianliIpSpider < Spiders::ApplicationSpider
  @name = "FreeJiangxianliIpSpider"
  @start_urls = [
            'https://www.baidu.com'
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
 urls = []

    2.times do |i|
      url = "http://ip.jiangxianli.com/?page=#{i+1}&country=中国"
      urls << "#{URI.encode(url)}"
    end


    in_parallel(:parse_all,urls, threads: 1)
  end


def parse_all(response, url:, data: {})
  # response.encoding = 'utf-8'
    # logger.info  "=============#{response}"
    # html = Nokogiri::HTML(html_str,nil,encoding)
    # html = Nokogiri::HTML(html_str,nil,'gbk')
    # logger.info  "=============#{html_str}"
        tr = response.xpath("//tbody/tr")

        # ips = []
        # logger.info response
        # logger.info  response.to_s
        tr.each_with_index do |t,index|

          # next if index == 0
          
          ip = t.xpath("./td[1]").text
          port = t.xpath("./td[2]").text

          protocol =  t.xpath("./td[4]").text

          # logger.info({ip: ip ,port: port,protocol: protocol , source: url})
          ::ProxyPool.find_or_create_by({ip: ip ,port: port,protocol: protocol , source: url})
        end
      end
end

end