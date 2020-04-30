module Scheduler
  class CheckProxyJob < ApplicationJob
    queue_as :check_proxy_job

    def perform
        puts "CheckProxyJob"
        records = []
        ProxyPool.archive.min_failed.actived.each do |record|
          records <<  perform_record(record)
        end
        ProxyPool.bulk_insert values: records
    end

    def perform_record(record)
        @proxy = record

        return true if @proxy.nil?
      long_time = 0
      begin
       long_time = time_of do 
         RestClient::Request.execute(method: :get, url: 'https://www.github.com/', proxy: "#{@proxy.protocol.downcase}://#{@proxy.ip}:#{@proxy.port}",timeout: 2)
       end
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
            @proxy.active = 0
            @proxy.check_count = @proxy.check_count.to_i + 1
            @proxy.fail_count = @proxy.fail_count.to_i + 1
            @proxy.long_time = long_time
      end

      return @proxy
    end


    def time_of &block
      time = Time.now.to_i
      puts "before time #{time}"
        block.call
      end_time = Time.now.to_i

      puts "end time #{end_time}"

      puts "long time #{(end_time - time) / 1000.00 }s"
      
      return end_time - time
    end
  end
end