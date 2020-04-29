module Spiders
  class FreeXiciIpSpider < Spiders::ApplicationSpider
  @name = "FreeXiciIpSpider"
  @start_urls = ["https://www.xicidaili.com/nn",
          "http://www.xicidaili.com/nt"]

def parse(response, url:, data: {})

    urls = []

    2.times do |i|
      urls << "#{url}/#{i+1}"
    end


    in_parallel(:parse_all,urls, threads: 1)
  end


    def parse_all(response, url:, data: {})
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


    end
end
  
end