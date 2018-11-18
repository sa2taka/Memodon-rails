import VueRouter from 'vue-router'
import HomePage from './components/Home'
import MemosPage from './components/Memos'
import TutorialPage from './components/TutorialModal'
import TagsPage from './components/Tags'
import ClawlingPage from './components/Crawling'

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
  {
    path: '/crawling',
    name: 'crawling',
    component: ClawlingPage
  }
]

export default new VueRouter({
  mode,
  routes
})
