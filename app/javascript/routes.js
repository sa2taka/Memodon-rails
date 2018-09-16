import VueRouter from 'vue-router'
import HomePage from './components/Home'
import MemosPage from './components/Memos'
import TutorialPage from './components/Tutorial'
import TagsPage from './components/Tags'

const mode = 'hash'
const routes = [{
    path: '/',
    component: HomePage
  },
  {
    path: '/memos',
    component: MemosPage
  },
  {
    path: '/tutorial',
    component: TutorialPage
  },
  {
    path: '/memos/tag/:tagname',
    component: MemosPage
  },
  {
    path: '/tags',
    component: TagsPage
  },
]

export default new VueRouter({
  mode,
  routes
})
