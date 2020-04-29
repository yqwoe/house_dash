module Scheduler
  class CheckProxyJob < ApplicationJob
    queue_as :check_proxy_job

    def perform
        puts "CheckProxyJob"
        ProxyPool.where(" (check_count is null and fail_count is null) or check_count < 5 and check_count != fail_count").pluck(:id).each do |id|
          ::CheckProxyIpJob.perform_later(id)
        end
    end
  end
end