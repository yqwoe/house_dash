import {
  fetchList
} from '@/services/villages'
export default {
  namespace: 'village',
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
        if (pathname === '/price/villages') {
          dispatch({
            type: 'fetchList'
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
        payload: {
          list: [...data]
        }
      })
    }
  }
}
