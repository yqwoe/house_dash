module Scheduler
  class CheckProxyJob < ApplicationJob
    queue_as :check_proxy_job

    def perform
        puts "CheckProxyJob"
        ProxyPool.valid.pluck(:id).each do |id|
          ::CheckProxyIpJob.perform_later(id)
        end
    end
  end
end