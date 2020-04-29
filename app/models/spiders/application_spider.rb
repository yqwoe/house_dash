# ApplicationSpider is a default base spider class. You can set here
# default settings for all spiders inherited from ApplicationSpider.
# To generate a new spider, run: `$ kimurai generate spider spider_name`
require 'net/http'
require 'kimurai'
require 'capybara/poltergeist'

require 'selenium-webdriver'
require 'mechanize'
require 'rest-client'

module Spiders

class ApplicationSpider < Kimurai::Base
  # include ApplicationHelper


  USER_AGENTS = Mechanize::AGENT_ALIASES.keys
  # resp = RestClient.get("http://localhost:5010/get_all/")

  # logger.info resp.body
  # ips = JSON.parse(resp.body).map{|proxy| "#{proxy["proxy"]}:http"}


  # PROXIES = ips 


  # Default engine for spiders (available engines: :mechanize, :poltergeist_phantomjs,
  # :selenium_firefox, :selenium_chrome)
  @engine =  :mechanize

  @config = {
     headers: {
    },

    ignore_ssl_errors: true,
    
    disable_images: true,
    user_agent: -> { USER_AGENTS.sample },

    # proxy: -> { "#{PROXIES.sample}" },
    window_size: [1366, 768],
    skip_request_errors: [
      { error: RuntimeError, message: "404 => Net::HTTPNotFound" },

      { error: Capybara::Poltergeist::StatusFailError, message: "404 => Net::HTTPNotFound" },

      { error: Selenium::WebDriver::Error::UnexpectedAlertOpenError, message: "404 => Net::HTTPNotFound" },
      
      { error: Net::HTTPNotFound, message: "404 => Net::HTTPNotFound" },
      { error: Net::HTTPBadGateway, message: "404 => Net::HTTPNotFound" },

      { error: Net::HTTP::Persistent::Error, message: "404 => Net::HTTPNotFound" },

    ],
	retry_request_errors: [],
    restart_if: {
      memory_limit: 6000000
    },
    before_request: {
      change_proxy: true,

      change_user_agent: true,

      # Clear all cookies before each request, works for all engines
    clear_cookies: true,

    
    delay: 1..10
    }
  }
end
  
end
