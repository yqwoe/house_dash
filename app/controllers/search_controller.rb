class SearchController < ApplicationController
  def index
    params[:q] ||= ""

    search_modules = [AreaPrice,CityPrice,House,Position,Property,VillagePrice,Village]
    search_modules << Page if defined?(Page)
    search_params = {
      query: {
        simple_query_string: {
          query: params[:q],
          default_operator: "AND",
          minimum_should_match: "70%",
          fields: %w[area feature title xiaoqu_ room total_price price louceng louxing chaoxiang zhuangxiu age quyu shoufu xiaoqu time address city tit jl desc type_id name district comarea ave_price type_id count_id building_count lh rj building_type  wy_price wy tcw company ]
        }
      },
      highlight: {
        pre_tags: ["[h]"],
        post_tags: ["[/h]"],
        fields: { 
          area: {},
          feature: {},
          title: {},
           xiaoqu_: {} ,
           room: {},
            total_price: {},
             price:{},
              louceng: {},
               louxing:{},
                chaoxiang:{},
                 zhuangxiu:{},
                  age:{},
                   quyu:{},
                    shoufu:{},
                     xiaoqu:{},
                      time:{},
                       address:{},
                        city:{},
                         tit:{},
                          jl:{},
                           desc:{},
                            type_id:{},
                             name:{},
                              district:{},
                               comarea:{},
                                ave_price:{},
                                 type_id:{},
                                  count_id:{},
                                   building_count:{},
                                    lh:{},
                                     rj:{},
                                      building_type:{},
                                        wy_price:{},
                                         wy:{},
                                          tcw:{},
                                           company:{}

         }
      }
    }
    @result = Elasticsearch::Model.search(search_params, search_modules).page(params[:page]).per(20)
    
    # binding.pry
    render json: @result
  end
end
