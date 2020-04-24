import React, { useEffect } from 'react';
import styles from './village_prices.css';
import { Scene, PointLayer } from '@antv/l7';
import { GaodeMap } from '@antv/l7-maps';
import {
  convert_amap_point
} from '@/utils/geo_convert'
import {
  connect
} from 'dva';

const VillagePrice =  ({dispatch,village}) => {
  const { list } = village;
  let scene;
  

  useEffect(() => {
    console.log("useEffect")
          const data = list.map(row=>{
            const {name,id,lat,lng,ave_price} = row.attributes
            return {
              name: name,
              ...convert_amap_point(parseFloat(lng), parseFloat(lat)),
              ave_price
            }
          })
            if(!data.length){
              // scene.removeLayer();
              return;
            }
                    scene = new Scene({
                     id: 'map',
                     map: new GaodeMap({
                       style: 'dark',
                       center: [113.625351, 34.746303],
                       pitch: 45,
                       zoom: 12.056,
                     }),
                   });
console.log(data)
                    scene.on('loaded', () => {
                      const pointLayer = new PointLayer({})
                        .source(data, {
                          parser: {
                            type: 'json',
                            x: 'lng',
                            y: 'lat',
                          },
                        })
                        .shape('circle')
                        .size('ave_price', [0, 16])
                        .color('ave_price', [
                          '#34B6B7',
                          '#4AC5AF',
                          '#5FD3A6',
                          '#7BE39E',
                          '#A1EDB8',
                          '#CEF8D6'
                        ])
                        .active(true)
                        .style({
                          opacity: 0.5,
                          strokeWidth: 0,
                        });
                      scene.addLayer(pointLayer);
                    });
                  },[]);
  return (
    <div>
      {
        list.length ? <div id = "map"
        style = {
          {
            width: '60%',
            height: "800px"
          }
        }
        /> : null 
      }
    </div>
  );
}


function mapStateToProps(state, ownProps) {
  return {
    loading: state.loading.global,
    ...state,
  };
}

export default connect(mapStateToProps)(VillagePrice);