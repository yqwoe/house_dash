module Scheduler
  class VillageCheckJob < ApplicationJob
    queue_as :village_check_job

    def perform
        village_names = Village.pluck(:name)
        area_keys = $redis.keys("areas_*")

       return true if area_keys.length == 0 
        villages = []

        area_keys.each do |area|
          json = $redis.get(area)

          array = JSON.parse(json)

          villages += array
        end


       return true if villages.length <= 0 

       villages = villages.reject{|v| village_names.include?(v[:text])}

        villages.each do |v|
          
        end
    end
  end
end