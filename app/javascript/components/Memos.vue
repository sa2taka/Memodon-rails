<template>
  <div id="memos" >
    This is Memos.
    <a class="btn" @click="_test_crawl">クロール</a>
    <memo :memo="memo" v-for="memo in memos" :key="memo.id"></memo>
  </div>
</template>

<script>
import Memo from './Memos/_memo.vue'
import axios from 'axios'

export default {
  name: 'memos',
  data () {
    return {
      memos: [],
      page: 1,
      size: 50
    }
  },
  mounted () {
    this.get_memos()

    document.addEventListener('resize', this.onResize)
  },
  methods: {
    _test_crawl: function () {
      const xhr = new XMLHttpRequest()
      const url = 'http://localhost:3000/memo/crawl'
      xhr.open('post', url, true)
      xhr.send()
    },
    get_memos: function () {
      const params = {
        page: this.page,
        size: this.size
      }
      const self = this
      axios.get('/api/memos', { params })
        .then(function(response) {
          self.memos = response.data
          self.$forceUpdate()
        })
    },
    onResize: function () {
      const width  = window.innerWidth
      const height = window.innerHeight
    }
  },
  components: {
    Memo
  }
}
</script>

<style scoped>
</style>
