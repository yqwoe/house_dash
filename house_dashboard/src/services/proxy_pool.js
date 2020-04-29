import request from '@/utils/request'

export function searchList(params) {
  return request({
    method: 'get',
    url: '/api/proxy_pools',
    params
  })
}
