import {
  fetchList
} from '@/services/city_price'
export default {
  namespace: 'city_price',
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
        if (pathname === '/price/city_price') {
          dispatch({
            type: 'fetchList'
          })
        }
      })
    }
  },
  reducers: {
    addList(state, action) {
      console.log(action)
      return {
        ...state,
        ...action.payload
      }
    }
  },
  effects: {
    * fetchList(action, {
      call,
      put
    }) {
      const {
        data
      } = yield call(fetchList, {})
      console.log(data)
      yield put({
        type:'addList',
        payload:{list:[...data]}
      })
    }
  }
}
