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
import {Card} from 'antd'

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
const CityPrice = ({dispatch, city_price}) => {
  const {
    list=[]
  } = city_price

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
    time: t.attributes.time,
    value: t.attributes.price,
  }));

  return (
    <div>
      <Card>
        <Chart height={400} data={data} scale={cols} forceFit>
          <h3 className="main-title" style={styles.mainTitle}>
            郑州房价走势
          </h3>
          <h4 className="sub-title" style={styles.subTitle}>
            2018 ~ 2020 房价走势
          </h4>
          <Axis name="time" />
          <Axis name="value" />
          <Geom type="line" position="time*value" size={2} />

          <Legend />
          <Tooltip crosshairs={{ type: 'y' }} />
          <Geom
            type="point"
            position="time*value"
            size={4}
            shape={'circle'}
            style={{
              stroke: '#fff',
              lineWidth: 1,
            }}
          />
        </Chart>
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

export default connect(mapStateToProps)(CityPrice);