import {
  searchList
}
from '@/services/search'
export default {
  namespace: 'search',
  state: {
    list: []
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
        // if (pathname === '/price/villages') {
        //   dispatch({
        //     type: 'fetchList'
        //   })
        // }
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
        data = []
      } = yield call(searchList, params)
      console.log(data)
      yield put({
        type:'addList',
        payload: {
          list: [...data]
        }
      })
    }
  }
}
