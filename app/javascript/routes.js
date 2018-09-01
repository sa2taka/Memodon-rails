import VueRouter from 'vue-router'
import HomePage from './components/Home'

const routes = [{
  path: '/', component: HomePage,
}];

export default new VueRouter({ routes })
