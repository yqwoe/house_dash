module Scheduler
  class CheckProxyJob < ApplicationJob
    queue_as :check_proxy_job

    def perform
        puts "CheckProxyJob"
        ProxyPool.where(" (check_count is null and fail_count is null) or check_count < 5 and check_count != fail_count").each do |proxy|
          ::CheckProxyIpJob.perform_later(proxy)
        end
    end
  end
end