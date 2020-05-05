 class CheckProxyIpJob < ApplicationJob
    queue_as :check_proxy_ip_job


def perform(id)
        @proxy = ProxyPool.find(id)

        return true if @proxy.nil?
      
       long_time =  0

        time = Time.now.to_i
            begin
              headers = {"User-Agent": "Mozilla/5.0"}

              resp = RestClient::Request.execute(method: :get, url: 'https://www.github.com', proxy: "#{@proxy.protocol.downcase}://#{@proxy.ip}:#{@proxy.port}",:timeout => 10,:open_timeout => 10,headers: headers)


              end_time = Time.now.to_i

              long_time = (end_time - time) / 1000.00
              #  puts resp.body
              if @proxy.fail_count.to_i > 0
                  @proxy.active = 1
                  @proxy.check_count = @proxy.check_count.to_i + 1
                  @proxy.fail_count = @proxy.fail_count.to_i - 1
                  @proxy.long_time = long_time
              else
                @proxy.active = 1
                  @proxy.check_count = @proxy.check_count.to_i + 1
                  @proxy.long_time = long_time
              end
            rescue => e
              Rails.logger.error e

              end_time = Time.now.to_i

              long_time = (end_time - time) / 1000.00
                  @proxy.active = 0
                  @proxy.check_count = @proxy.check_count.to_i + 1
                  @proxy.fail_count = @proxy.fail_count.to_i + 1
                  @proxy.long_time = long_time
            end
      return @proxy.save!
    end


    def time_of &block
      puts "before time #{time}"
        block.call

      puts "end time #{end_time}"

      puts "long time #{(end_time - time) / 1000.00 }s"
      
      return (end_time - time) / 1000.00
    end
  end