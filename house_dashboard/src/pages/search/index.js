import React from 'react';
import styles from './index.css';
import {
  Input,
  Card,
  Row,
  Col
}
from 'antd'
import {
  connect
} from 'dva';
const {
  Search
} = Input;
const SearchPage = ({
    dispatch,
    search
  }) => {

  const {list} = search

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

  return (
    <div style={{
      height: 'calc(100vh - 64px)',
      position: "relative"
    }}>

    <Row style = {
      {
        position: "absolute"
        , width: '100%',
        top: 'calc(30% - 64px)'
      }
    } >
    <Col md = {
      {
        span: 10,
        offset: 7
      }
    }
    lg = {
      {
        span: 10,
        offset: 7
      }
    }
    xs ={{span: 22,offset: 1}}>
      < Search
      placeholder = "试试输入 学校?"
      enterButton = "搜索"
      size = "large"
      maxLength = {
        100
      }
      style = {
        {
          // // position: 'fixed',
          // // top: '40% ',
          // left: '50%',
          // transform: 'translate(-50% , -50% )',
          width: '100%'
        }
      }
      onSearch = {
        handleSearch
      }
      />
    </Col>
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
