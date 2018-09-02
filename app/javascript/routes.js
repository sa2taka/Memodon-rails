import VueRouter from 'vue-router'
import HomePage  from './components/Home'
import MemosPage from './components/Memos'

const mode = 'hash'
const routes = [
  { path: '/',      component: HomePage },
  { path: '/memos', component: MemosPage },
]

export default new VueRouter({ mode, routes })
