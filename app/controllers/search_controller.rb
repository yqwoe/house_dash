# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    params[:q] ||= ''
    @result = []
    if params[:q].present?
      #room total_price price louceng louxing age  shoufu xiaoqu time ave_price  count_id building_count wy_price 
      search_modules = [AreaPrice, CityPrice, House, VillagePrice, Village]
      search_modules << Page if defined?(Page)
      search_params = {
        query: {
          simple_query_string: {
            query: params[:q],
            default_operator: 'AND',
            minimum_should_match: '70%',
            fields: %w[area feature title xiaoqu_  chaoxiang zhuangxiu quyu  address city tit jl desc type_id name district comarea type_id  lh rj building_type wy tcw company ]
          }
        },
        highlight: {
          pre_tags: ['[h]'],
          post_tags: ['[/h]'],
          fields: {
            area: {},
            feature: {},
            title: {},
            xiaoqu_: {},
            room: {},
            total_price: {},
            price: {},
            louceng: {},
            louxing: {},
            chaoxiang: {},
            zhuangxiu: {},
            age: {},
            quyu: {},
            shoufu: {},
            xiaoqu: {},
            time: {},
            address: {},
            city: {},
            tit: {},
            jl: {},
            desc: {},
            type_id: {},
            name: {},
            district: {},
            comarea: {},
            ave_price: {},
            type_id: {},
            count_id: {},
            building_count: {},
            lh: {},
            rj: {},
            building_type: {},
            wy_price: {},
            wy: {},
            tcw: {},
            company: {}

          }
        }
      }
      @result = Elasticsearch::Model.search(search_params, search_modules).page(params[:page]).per(20)

    end
    # binding.pry
    render json: { data: @result ,total: @result.results.total}
  end
end
