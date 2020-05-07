
// export function onRouteChange({ location, routes, action }) {
//   console.log(location.pathname);
// }


// export const footerRender = (props) => {
//     console.log(props)
//     return ( <div> aaaaaaaaaaaaaaaaaaa </div>)
//       }



export const layout = {
  footerRender: (initInfo) => {
      console.log(initInfo)
      return ( <div align='center'> <a href='https://rm-rf.one/about/' target='_blank'>About @yqwoe </a> </div>)
      }
};