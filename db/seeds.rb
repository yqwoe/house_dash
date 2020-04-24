# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




Category.create({
    name:"二手房",
    key:"ershoufang",
    path:"/ershoufang/",
    url:"https://zz.lianjia.com/ershoufang/",
    :parent => nil
})

Category.create({
    name:"新房",
    key:"fang",
    path:"/fang/",
    url:"https://zz.fang.lianjia.com/",
    :parent => nil
})


Category.create({
    name:"租房",
    key:"zufang",
    path:"/zufang/",
    url:"https://zz.lianjia.com/zufang/",
    :parent => nil
})


