import request from '@/utils/request'

export function fetchList(params) {
  return request({
    method: 'get',
    url: '/api/area_prices',
    params: {
      area_name: params.params
    }
  })
}

export function fetchAreaList(params) {
  return request({
    method: 'get',
    url: '/api/area_prices/areas',
    params
  })
}
