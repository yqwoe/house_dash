import React, { useEffect, useState,memo } from 'react';
import styles from './village_prices.css';
// import { Scene, PointLayer } from '@antv/l7';
// import { GaodeMap } from '@antv/l7-maps';

import { PointLayer, PolygonLayer, AMapScene } from '@antv/l7-react';
import {
  convert_amap_point
} from '@/utils/geo_convert'
import {
  connect
} from 'dva';

import {Card} from 'antd'

const VillagePrice =  memo(({dispatch,village}) => {
  const [data=[], setData] = React.useState();
  const { list } = village;
  

  useEffect(() => {
    console.log("useEffect")
          const data = list.map(row => {
            const { name, id, lat, lng, ave_price } = row.attributes;
            return {
              name: name,
              ...convert_amap_point(parseFloat(lng), parseFloat(lat)),
              ave_price,
            };
          });

          setData(data);
                  },[]);

          console.log(data);
  return (
    <div>
      <Card style={{ height: 800 }}>
        <AMapScene
          map={{
            center: [113.625351, 34.746303],
            pitch: 45,
            style: 'dark',
            zoom: 12.056,
          }}
          style={{
            position: 'absolute',
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
          }}
        >
          {/**{data && (
            <PolygonLayer
              key={'3'}
              source={{
                data,
                parser: {
                  type: 'json',
                  x: 'lng',
                  y: 'lat',
                },
              }}
              size={{
                field: 'ave_price',
                values: [100, 120, 160, 200, 260, 500],
              }}
              color={{
                field: 'ave_price',
                values: [
                  '#816CAD',
                  '#A67FB5',
                  '#C997C7',
                  '#DEB8D4',
                  '#F5D4E6',
                  '#FAE4F1',
                  '#FFF3FC',
                ],
              }}
              shape={{
                values: 'extrude',
              }}
              style={{
                opacity: 1.0
              }}
            />
          )} */}
          {data && (
            <PointLayer
              key={'2'}
              source={{
                data,
                parser: {
                  type: 'json',
                  x: 'lng',
                  y: 'lat',
                },
              }}
              size={{
                field: 'ave_price',
                values: [0, 16],
              }}
              color={{
                field: 'ave_price',
                values: [
                  '#34B6B7',
                  '#4AC5AF',
                  '#5FD3A6',
                  '#7BE39E',
                  '#A1EDB8',
                  '#CEF8D6',
                ],
              }}
              active={true}
              shape={{
                values: 'circle',
              }}
              style={{
                opacity: 0.5,
                strokeWidth: 0,
              }}
            />
          )}
        </AMapScene>
      </Card>
    </div>
  );
});


function mapStateToProps(state, ownProps) {
  return {
    loading: state.loading.global,
    ...state,
  };
}

export default connect(mapStateToProps)(VillagePrice);