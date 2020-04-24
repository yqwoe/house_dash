import React from 'react';
import { connect } from 'dva';
import {
  G2,
  Chart,
  Geom,
  Axis,
  Tooltip,
  Coord,
  Label,
  Legend,
  View,
  Guide,
  Shape,
  Facet,
  Util,
} from 'bizcharts';
import {
  Card,
  Button
} from 'antd'

import {
  Select
} from 'antd';

const {
  Option
} = Select;

const styles = {
  mainTitle: {
    fontSize: 20,
    color: 'black',
    textAlign: 'center',
  },
  subTitle: {
    fontSize: 16,
    color: 'gray',
    textAlign: 'center',
  },
};
const AreaPrice = ({dispatch, area_price}) => {
  const {
    list=[],area_list=[],params=[]
  } = area_price

  const cols = {
    value: {
      alias: '平均价格',
    },
    time: {
      alias: '时间',
      tickCount: list.length,
    },
  };
  const data = list.map(t => ({
    area_name: t.attributes.area_name,
    time: t.attributes.time,
    value: t.attributes.price,
  }));

  console.log(data)

  const handleChange  =(value) =>{
    console.log(value)
    if(value.length){
      dispatch({
        type: 'area_price/addList',
        payload: {
          params: value
        }
      })
    }
  }

  const handleClick = (e)=>{
    console.log(e)
    // e.target.event
    if(params.length){
      dispatch({
        type: 'area_price/fetchList',
        payload: {
          params
        }
      })
    }
  }

  return (
    <div>
      <Card>
        <Select size="large"  
          mode = "multiple"
          onChange = {
            handleChange
          }
          placeholder="请选择区域"
          style = {
            {
              width: 400
            }
          }
          filterOption = {
            (input, option) =>
            option.children.toLowerCase().indexOf(input.toLowerCase()) >= 0
          } >
          {
            area_list.map(area=><Option key={area} value={area}>{area}</Option>)
          }
        </Select> <Button size="large"  type="primary" onClick={handleClick}>查询</Button >
        {
          data.length ? <Chart height={400} data={data} scale={cols} forceFit>

          <Legend />
          <h3 className="main-title" style={styles.mainTitle}>
            郑州各区域房价走势
          </h3>
          <h4 className="sub-title" style={styles.subTitle}>
            2018~2020 各区域房价走势
          </h4>
          <Axis name="time" />
          <Axis name="value" />
          <Tooltip crosshairs={{ type: 'y' }} />
          <Geom type="line" position="time*value" size={2} color={"area_name"} 
            shape={"smooth"}/>

          <Geom
            type="point"
            position="time*value"
            size={4}
            shape = {
              'circle'
            }
            color = {
              "area_name"
            }
            style={{
              stroke: '#fff',
              lineWidth: 1,
            }}
          />
        </Chart> : null
        }
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

export default connect(mapStateToProps)(AreaPrice);