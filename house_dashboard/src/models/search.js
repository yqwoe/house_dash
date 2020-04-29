import {
  searchList
}
from '@/services/search'

import {
  routerRedux
} from 'dva/router';
export default {
  namespace: 'search',
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
        if (pathname === '/search') {
           if(query){
             dispatch({
               type: 'addList',
               payload: {
                 params: query
               }
             })
           }
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
      yield put(routerRedux.push({pathname: '/search',query:params}))
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
