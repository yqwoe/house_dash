
module Spiders
  class AreaCheckSpider < Spiders::ApplicationSpider
   @name = "AreaCheckSpider"
  @start_urls = [
    "https://m.fang.com/fangjia/zz_list_pinggu/?cfrom=homePage"
  ]
  @config = {
  }

  ERROR = "不限"
  HOST = "https://zz.esf.fang.com"

  def parse(response, url:, data: {})

    urls = []
      response.xpath("//section[@id='country']//a[text()!='不限']").each_with_index do |link|
          
        url_ =response.xpath("//dl[@id='comarea_param_#{link["data-id"]}']/dd[1]/a")[0]["href"]
        request_to :parse_village_info,url: "http:#{url_}"
      end 
  end

  def parse_village_info(response, url:, data: {})
    posts_headers_path = "//input[@data-id='total']"
    more_list_path = "//ul[@id='more_add']/li[@dataflag='bg']"

    # logger.info response.xpath(posts_headers_path)[0]["value"].to_i
    count = response.xpath(posts_headers_path)[0]["value"].to_i

    data = []
    loop do
      browser.user_agent_alias = 'Windows IE 7'
      browser.execute_script("window.scrollBy(0,100000)") ; sleep 2
      response = browser.current_response

      new_count = response.xpath(more_list_path).count

      if count == new_count || count <= new_count

        li_array =  response.xpath("#{more_list_path}/a")
        li_array.each do |li|
          page_url = li["href"]

          text = li.xpath("./div[@class='txt']/h3").text
          logger.info page_url
          logger.info text
          data << {
            url: "http:#{page_url}",
            text: text
          }
        end

        logger.info "> Pagination is done #{count} - #{new_count}" and break
      else
        logger.info "> Continue scrolling, current count is  #{new_count} - total #{count}..."
      end
    end

    key = response.xpath("//input[@data-id='district']")[0]["value"]

    $redis.set("areas_#{key}",data)
  end
end

end