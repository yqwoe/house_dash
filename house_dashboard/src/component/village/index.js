import {
  List,
  Tag,
  Card
} from 'antd';

const Meta = List.Item.Meta

const Village = ({
  record
}) => {

  const {_source={}, _id, _index,highlight = {}
  } = record;

  const {
    age,
    ave_price,
    building_count,
    building_type,
    comarea,
    company,
    count_id,
    created_at,
    desc,
    district,
    id,
    lh,
    name,
    rj,
    tcw,
    type_id,
    updated_at,
    v_id,
    wy,
    wy_price,
  } = _source
  return ( <Card>< Meta key = {
        `${_index}${_id}`
      }

      title = {
       name
    }
    description = {
      Object.keys(_source).map(key => <Tag>{_source[key]}</Tag>)
    }
    /> </Card>
  )
};
export default Village;