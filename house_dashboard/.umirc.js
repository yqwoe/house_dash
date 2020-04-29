import { defineConfig } from 'umi';

export default defineConfig({
  nodeModulesTransform: {
    type: 'none',
  },
  history: { type: 'hash' },
  layout: {
    name: 'rm -rf /',
    locale: true,
    layout: 'topmenu'
  },
  routes: [
    { path: '/', component: '@/app' },
    {
      path: '/price',
      icon: 'BarChartOutlined',
      menu: {
        name: '郑州房价',
      },
      routes: [
        {
          path: 'city_price', // 该路径，不是相对父节点的路径，需要把父路径带上
          name: '郑州房价', // 二级菜单的名字
          icon: 'BarChartOutlined', // 二级菜单的路标
          component: '@/pages/price/city_price', // 访问的文件是 src/pages/hb/hbIndex.js
        },
        {
          path: 'area_price', // 该路径，不是相对父节点的路径，需要把父路径带上
          name: '郑州区域房价', // 二级菜单的名字
          icon: 'BarChartOutlined', // 二级菜单的路标
          component: '@/pages/price/area_price', // 访问的文件是 src/pages/hb/hbIndex.js
        },
        {
          path: 'villages', // 该路径，不是相对父节点的路径，需要把父路径带上
          name: '郑州小区房价地图', // 二级菜单的名字
          icon: 'BarChartOutlined', // 二级菜单的路标
          component: '@/pages/price/village_prices', // 访问的文件是 src/pages/hb/hbIndex.js
        },
      ],
      access: 'canRead',
    },
    // {
    //   path: '/search',
    //   icon: 'SearchOutlined',
    //   menu: {
    //     name: '搜索',
    //   }, // 二级菜单的路标
    //   component: '@/pages/search/index', // 访问的文件是 src/pages/hb/hbIndex.js
    // },
     {
      path: '/proxy_pool',
      icon: 'SearchOutlined',
      menu: {
        name: 'ip查询',
      }, // 二级菜单的路标
      component: '@/pages/proxy_pool/index', // 访问的文件是 src/pages/hb/hbIndex.js
    },
  ],
  proxy: {
    '/api': {
      target: 'http://localhost:3001',
      pathRewrite: { '^/api': '' },
      changeOrigin: true,
    },
  },
});
