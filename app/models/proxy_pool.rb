class ProxyPool < ApplicationRecord

  scope :actived,->{
    where("active is not null and active <> 0")
    .order("updated_at desc")
  }

  scope :valid,->{
    where("active is not null and active <> 0")
    .or(where("check_count is null and fail_count is null"))
    .or(where("fail_count < 5"))
    .order("updated_at desc")

  }

end
