require 'json'
namespace :houses_es do
    desc '初始化房屋信息'
    task :import ,[:uri] => :environment do |t, args|
        dirs = Dir::foreach(args[:uri]){ |f|


          next if f == '.' || f == '..'
        
          path = f.split("_")

          child = Category.find_by_key(path[1])
          file = File.read("#{args[:uri]}/#{f}")
          data = JSON.parse(file)
         houses = data.first["data"]


         houses.each do |house|
            
            position = Position.find_or_create_by({
                name: house["position"],
                category: child
            })

            property = Property.find_or_create_by({
                name: house["property_name"]
            })

            house_hash = House.find_or_create_by({
                name: house["title"],
                property: property,
                position: position,
                url: house["url"],
                unit_price: house["unit_price"],
                price: house["total_price"],
                area: house["area"]
            })

            tags = house["desc"].split(",")
            tags.each do |t|
                tag = Tag.find_or_create_by({
                    name: t
                })

                tags_houses = TagsHouse.find_or_create_by({
                    tag: tag,
                    house: house_hash
                })
            end
            
        end




        }
    end  
end
