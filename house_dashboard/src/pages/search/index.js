import React from 'react';
import styles from './index.css';
import {
  Input,
  Card,
  Row,
  Col,
  List
}
from 'antd'
import {
  connect
} from 'dva';
const {
  Search
} = Input;
import {
  replaceComponent
} from '@/utils/componentUtil'
const SearchPage = ({
    dispatch,
    search
  }) => {

  const {
    list,
    params = {},
    total
  } = search


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

  const rowStyleResult = {
    position: "absolute",
    width: '100%',
    top: '10px'
  }

  const colMd = {
    span: 10,
    offset: 7
  }

  const colMdResult = {
    span: 10,
    offset: 1
  }

  const colLg = {
    span: 10,
    offset: 7
  }
  const colLgResult = {
    span: 10,
    offset: 1
  }

  const colXs = {
    span: 22,
    offset: 1
  }

  return (
    <div style={{
      height: 'calc(100vh - 64px)',
      position: "relative"
    }}>

    <Row
    style = {
      !list.length ? rowStyle : rowStyleResult
    } >
    <Col md = {
      !list.length ?  colMd : colMdResult
    }
    lg = {
     !list.length ? colLg : colLgResult
    }
    xs = {
     colXs
    } >
      < Search
      placeholder = "试试输入 学校?"
      enterButton = "搜索"
      size = "large"
      maxLength = {
        100
      }
      defaultValue = {
        params.q
      }
      style = {
        {
          width: '100%'
        }
      }
      onSearch = {
        handleSearch
      }
      />
    </Col>
  </Row>

  < Row gutter = {
    {
      md: 20
    }
  }
  style = {
      {
        padding: "80px 0px"
      }
    } >
    <Col md = {
      {span:14
      }
    }
  lg = {
  {
    span: 14
  }
  }
  xs = {
      {span: 22,offset: 1}
    } > 
    
    {
      list.length ?  <List
    itemLayout="vertical"
    size="large"
    pagination={{
      position: 'both',
      size: "small",
      pageSize: 20,
      showSizeChanger: false,
      onChange: page => {
        dispatch({
          type: 'search/searchList',
          payload: {
            params: {
              ...params,
              page
            }
          }
        })
      },
      total
    }}
    dataSource={list}
    footer={
      <div>
        <b>搜索结果: </b> {total}条
      </div>
    }
    renderItem={item => (
      replaceComponent(item)
    )}
  /> : null
    }
    </Col> 
    <Col></Col>

    </Row>
    </div>
  );
}

function mapStateToProps(state, ownProps) {
  return {
    loading: state.loading.global,
    ...state,
  };
}

export default connect(mapStateToProps)(SearchPage);
