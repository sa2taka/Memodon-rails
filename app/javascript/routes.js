import VueRouter from 'vue-router'
import HomePage from './components/Home'
import MemosPage from './components/Memos'
import TutorialPage from './components/Tutorial'
import TagsPage from './components/Tags'

const mode = 'hash'
const routes = [{
    path: '/',
    name: 'home',
    component: HomePage
  },
  {
    path: '/memos',
    name: 'memos',
    component: MemosPage
  },
  {
    path: '/tutorial',
    name: 'tutorial',
    component: TutorialPage
  },
  {
    path: '/memos/tag/:tagname',
    name: 'tag',
    component: MemosPage
  },
  {
    path: '/tags',
    name: 'tags',
    component: TagsPage
  },
]

export default new VueRouter({
  mode,
  routes
})
