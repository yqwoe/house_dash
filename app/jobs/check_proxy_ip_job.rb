class CheckProxyIpJob < ApplicationJob
    queue_as :check_proxy_ip_job

    def perform(id)
        @proxy = ProxyPool.find_by_id(id)

        return true if @proxy.nil?

      begin
        raise '异常'
        resp = RestClient::Request.execute(method: :get, url: 'https://www.github.com/', proxy: "#{@proxy.protocol.downcase}://#{@proxy.ip}:#{@proxy.port}",timeout: 2)
        @proxy.update(:active => 1,:check_count => @proxy.check_count.to_i + 1)
      rescue => e
        Rails.logger.error e
        @proxy.update(:active => 0,:check_count => @proxy.check_count.to_i + 1,:fail_count => @proxy.fail_count.to_i + 1)
        return true
      end
    end
  end