import {
  List,
  Tag,
  Card
} from 'antd';

const Meta = List.Item.Meta

const House = ({
  record
}) => {

  const {_source={}, _id, _index,highlight = {}
  } = record;

  const {
    age,
    area,
    chaoxiang,
    created_at,
    feature,
    id,
    louceng,
    louxing,
    price,
    quyu,
    room,
    shoufu,
    title,
    total_price,
    updated_at,
    v_id,
    village_id,
    xiaoqu,
    xiaoqu_,
    zhuangxiu,
  } = _source
  return ( <Card>< Meta key = {
        `${_index}${_id}`
      }
      title = {
      title
    }
    description = {
      Object.keys(_source).map(key => <Tag>{_source[key]}</Tag>)
    }
    /> </Card>
  )
};
export default House;