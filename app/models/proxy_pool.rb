class ProxyPool < ApplicationRecord


  scope :archive,->{
    where("check_count is null and fail_count is null")
  }

  scope :min_failed,->{
    where("fail_count < 5")
  }

  scope :actived,->{
    where("active is not null and active <> 0").order("updated_at desc")
  }

end
