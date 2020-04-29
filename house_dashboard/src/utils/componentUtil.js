
import House from '@/component/house'
import Village from '@/component/village'
export function replaceComponent(record){
    const {_index,_id} = record
    const map = {
      "houses": <House key={`${_index}${_id}`} record = {
        record
      }/>,
      "villages":<Village key={`${_index}${_id}`} record = {
        record
      }/>
    };
    return map[_index] ? map[_index] : JSON.stringify(record)
}