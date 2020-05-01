import React from 'react';
import styles from './index.css';
import {
  Input,
  Card,
  Row,
  Col,
  List,
  Table, Tag
}
from 'antd'
const {
  Column,
  ColumnGroup
} = Table;
import {
  connect
} from 'dva';
const {
  Search
} = Input;
import {
  replaceComponent
} from '@/utils/componentUtil'

import moment from 'moment';
const ProxyPoolPage = ({
    dispatch,
    proxy_pool
  }) => {

  const {
    list,
    params = {},
    total
  } = proxy_pool

  console.log(list)


  const handleSearch=(value)=>{
    dispatch({
      type: 'search/searchList',
      payload: {
        params: {
          q: value,
          page: 1
        }
      }
    })
  }

  const rowStyle = {
    position: "absolute",
    width: '100%',
    top: 'calc(30% - 65px)'
  }

  const colMd = {
    span: 10,
    offset: 7
  }

  const colLg = {
    span: 10,
    offset: 7
  }

  const colXs = {
    span: 22,
    offset: 1
  }

  const columns = [
    {
      title: 'IP',
      dataIndex: 'ip',
      key: 'ip',
    },
    {
      title: 'PORT',
      dataIndex: 'port',
      key: 'port',
    },
    {
      title: 'http/https',
      dataIndex: 'protocol',
      key: 'protocol',
    },
    {
      title: '状态',
      dataIndex: 'active',
      key: 'active',
      render(text, record, index) {
        if (!record.check_count || !record.check_count) return '待验证';
        return text == 1 ? '可用' : '失效';
      },
    },
    {
      title: '检查次数',
      dataIndex: 'check_count',
      key: 'check_count',
    },
    {
      title: '失败次数',
      dataIndex: 'fail_count',
      key: 'fail_count',
    }, {
      title: '检测耗时',
      dataIndex: 'long_time',
      key: 'long_time'
    },
    {
      title: '最后验证时间',
      dataIndex: 'updated_at',
      key: 'updated_at',
      render(text, record, index) {
        return moment(text).format('YYYY-MM-DD HH:mm:ss');
      },
    },
  ];

  return (
    <div style={{
     
    }}>
      <Card>
      <Table dataSource = {
       list.map(row => ({
         id: row.id,
         ...row.attributes
       }))
     }
     rowKey = {
       record => record.id
     }
     columns = {
       columns
     }
     pagination = {
       {
         pageSize: 25,
         total,
         showSizeChanger: false,
         onChange(page){
           dispatch({
             type: 'proxy_pool/searchList',
             payload: {
               params: {
                 ...params,
                 page
               }
             }
           })
         }
       }
     }
     />
      </Card>
    </div>
  );
}

function mapStateToProps(state, ownProps) {
  return {
    loading: state.loading.global,
    ...state,
  };
}

export default connect(mapStateToProps)(ProxyPoolPage);
