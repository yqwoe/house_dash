import {
  fetchList, fetchAreaList
} from '@/services/area_price'
export default {
  namespace: 'area_price',
  state: {
    list: [],
    area_list:[],
    params:[]
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
        if (pathname === '/price/area_price') {
          dispatch({
            type: 'fetchAreaList'
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
      } = yield call(fetchList, action.payload)
      console.log(data)
      yield put({
        type:'addList',
        payload:{list:[...data]}
      })
    },
    * fetchAreaList(action, {
      call,
      put
    }) {
      const {
        data
      } = yield call(fetchAreaList, {})
      console.log(data)
      yield put({
        type: 'addList',
        payload: {
          area_list: [...data]
        }
      })
    }
  }
}
