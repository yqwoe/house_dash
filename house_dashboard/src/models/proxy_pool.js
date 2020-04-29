import {
  searchList
}
from '@/services/proxy_pool'

import {
  routerRedux
} from 'dva/router';
export default {
  namespace: 'proxy_pool',
  state: {
    list: [],
    params:{},
    total: 0
  },
  subscriptions: {
    setup({
      dispatch,
      history,
      query
    }) {
      return history.listen(async ({
        pathname,
        search,
        query
      }) => {
        if (pathname === '/proxy_pool') {
          console.log(query)
           dispatch({
             type: 'searchList',
             payload: {
               params: query
             }
           })
        }
      })
    }
  },
  reducers: {
    addList(state, action) {
      return {
        ...state,
        ...action.payload
      }
    }
  },
  effects: {
    * searchList(action, {
      call,
      put
    }) {

      const {params} = action.payload
      const {
        data, total
      } = yield call(searchList, params)
      console.log(data)
      // yield put(routerRedux.push({
      //   pathname: '/proxy_pool',
      //   query: params
      // }))
      yield put({
        type:'addList',
        payload: {
          list: [...data],
          total
        }
      })
    }
  }
}
