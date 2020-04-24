import request from '@/utils/request'

export function fetchList(params) {
  return request({
    method: 'get',
    url: '/api/city_prices',
    params
  })
}
