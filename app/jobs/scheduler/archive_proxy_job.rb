module Scheduler
  class ArchiveProxyJob < ApplicationJob
    queue_as :archive_proxy_job

    def perform
       ::Archive66ProxyJob.perform_later
       ::Archive89ProxyJob.perform_later
       ::Archive3366ProxyJob.perform_later
       ::ArchiveGbjProxyJob.perform_later
       ::ArchiveJxlProxyJob.perform_later
       ::ArchiveKuaiProxyJob.perform_later
       ::ArchiveQyProxyJob.perform_later
       ::ArchiveXiciProxyJob.perform_later
       ::ArchiveXilaProxyJob.perform_later
    end
  end
end