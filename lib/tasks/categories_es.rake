require 'json'

namespace :categories_es do


    desc '初始化房型分类'
task :import => :environment do |t, args|
 
    file = File.read("/Users/yqwoe/workspace/spiader/house_dash/lib/tasks/es_house_links.json")
    data = JSON.parse(file)
  @cattegories = []
@hash_data = Hash.new
  data.first["data"].uniq.each{|row| 
    @hash_data["#{row["name"]}"] = row
  }
  @cattegories = @hash_data.values



  @root = Category.find_by_name("二手房")
  @cattegories.each do |category|
    
    key = category["key"].split("/")
    parent = key[1]
    me = key[2]
    t = key[3]

    if !me
      Category.create({
        name:category["name"],
        key:parent,
        path:category["path"],
        url:category["url"],
        :parent => @root
    })
    elsif !t
      @parent = Category.find_by_key(parent)
      Category.create({
        name:category["name"],
        key:me,
        path:category["path"],
        url:category["url"],
        :parent => @parent 
    })
  else
    @parent = Category.find_by_key(me)
    Category.create({
      name:category["name"],
      key:t,
      path:category["path"],
      url:category["url"],
      :parent => @parent 
  })
    end

    end
  
  p @cattegories.length,data.first["data"].length

end  
end
