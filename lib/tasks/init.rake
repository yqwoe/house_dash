require 'json'

namespace :init do

    desc '初始化area 走势'
    task :area_import => :environment do |t, args|
        uri = "#{__dir__}/json/area/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            prices = data.first["d"]
            
            JSON.parse(prices).each do |price|
                AreaPrice.find_or_create_by({
                    time: Time.at(price.first.to_i / 1000),
                    price: price.last,
                    area_name: f.gsub(".json","")
                })
            end
        }
        p "初始化area 走势 done"
    end

    desc '初始化 city 走势'
    task :city_import => :environment do |t, args|
        uri = "#{__dir__}/json/city/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            prices = data.first["d"]
            ps = prices.split("&")
            JSON.parse(ps[0]).each do |price|
                CityPrice.find_or_create_by({
                    time: Time.at(price.first.to_i / 1000),
                    price: price.last
                })
            end
        }
        p "初始化city 走势 done"
    end

    desc '初始化 village 走势'
    task :village_import => :environment do |t, args|
        uri = "#{__dir__}/json/village_j/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            prices = data.first["d"]
            
            JSON.parse(prices).each do |price|
                VillagePrice.find_or_create_by({
                    time: Time.at(price.first.to_i / 1000),
                    price: price.last,
                    v_id: f.gsub(".json",""),
                    village: Village.find_by_v_id(f.gsub(".json",""))
                })
            end
        }
        p "初始化village 走势 done"
    end

    desc '初始化 villages 数据'
    task :villages_import => :environment do |t, args|
        uri = "#{__dir__}/json/village/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            v_id = f.gsub(".json","")
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            village = data.first
            attrs = {
                "name": "name",
                "id": "v_id",
                "district": "district",
                "comarea": "comarea",
                "avePrice": "ave_price",
                "age": "age",
                "type": "type_id",
                "count": "count_id",
                "building_count": "building_count",
                "lh": "lh",
                "rj": "rj",
                "desc": "desc",
                "building_type": "building_type",
                "wy_price": "wy_price",
                "wy": "wy",
                "tcw": "tcw",
                "company": "company"
              }
              mo = Hash.new
              attrs.each do |k,v|
                mo[v.to_sym] = village[k.to_s]
              end
              p mo 

            #   p village 
              @village = Village.find_or_create_by(mo)

        }
        p "初始化village 走势 done"
    end


    desc '初始化 position '
    task :position_import => :environment do |t, args|
        uri = "#{__dir__}/json/position/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            position = data.first
            attrs = {
                "x": "x",
                "y": "y",
                "id": "v_id",
                "address": "address",
                "city": "city"
              }
              mo = Hash.new
              attrs.each do |k,v|
                mo[v.to_sym] = position[k.to_s]
              end

            #   p village 
              @village = Village.find_by_v_id(mo[:v_id])

              Position.find_or_create_by(mo.merge({village: @village}))
        }
        p "初始化position 走势 done"
    end

    desc '初始化 property '
    task :property_import => :environment do |t, args|
        uri = "#{__dir__}/json/property/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            property = data.first
            attrs = {
                "dt": "地铁",
                "gj": "公交",
                "xx": "学校",
                "yy": "医院",
                "gw": "购物"
              }


            #   p village 
            @village = Village.find_by_v_id(f.gsub(".json",""))
              mo = Hash.new
              attrs.each do |k,v|
                p property
                property[k.to_s] && property[k.to_s].each do |pp|
                    
                    Property.find_or_create_by(pp.merge({village: @village,type_id: v}))
                end
              end


        }
        p "初始化property 走势 done"
    end


    desc '初始化 house '
    task :house_import => :environment do |t, args|
        uri = "#{__dir__}/json/house/"
        Dir::foreach(uri){|f|

            next if f == '.' || f == '..'
            Rails.logger.info f
            file = File.read("#{uri}#{f}")
            data = JSON.parse(file)
            attrs = {
                "id": "v_id",
                "area": "area",
                "feature": "feature",
                "title": "title",
                "xiaoqu_": "xiaoqu_",
                "room": "room",
                "total_price": "total_price",
                "price": "price",
                "louceng": "louceng",
                "louxing": "louxing",
                "chaoxiang": "chaoxiang",
                "zhuangxiu": "zhuangxiu",
                "age": "age",
                "quyu": "quyu",
                "shoufu": "shoufu",
                "xiaoqu": "xiaoqu"
              }


            #   p village 
            @village = Village.find_by_v_id(f.gsub(".json",""))
            data.each do |row|
                mo = Hash.new
                attrs.each do |k,v|
                    mo[v]=row[k.to_s]
                end 
                House.find_or_create_by(mo.merge({village: @village}))
            end
              


        }
        p "初始化 house 走势 done"
    end



end
