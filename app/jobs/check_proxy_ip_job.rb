class CheckProxyIpJob < ApplicationJob
    queue_as :check_proxy_ip_job

    def perform(id)
        @proxy = ProxyPool.find_by_id(id)

        return true if @proxy.nil?
      long_time = 0
      begin
       long_time = time_of do 
         RestClient::Request.execute(method: :get, url: 'https://www.github.com/', proxy: "#{@proxy.protocol.downcase}://#{@proxy.ip}:#{@proxy.port}",timeout: 2)
       end
         @proxy.update(:active => 1,:check_count => @proxy.check_count.to_i + 1,long_time: long_time)
      rescue => e
        Rails.logger.error e
        @proxy.update(:active => 0,:check_count => @proxy.check_count.to_i + 1,:fail_count => @proxy.fail_count.to_i + 1,long_time: long_time)
        return true
      end
    end


    def time_of &block
      time = Time.now.to_i
      logger.info "before time #{time}"
        block.call
      end_time = Time.now.to_i

      logger.info "end time #{end_time}"

      logger.info "long time #{(end_time - time) / 1000.00 }s"
      
      return end_time - time
    end
    
  end