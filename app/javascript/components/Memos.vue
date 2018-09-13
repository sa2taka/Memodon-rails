<template>
  <div id="memos" >
    This is Memos.
    <a class="btn" @click="_test_crawl">クロール</a>
    <a class="btn" @click="isTwoColumn = !isTwoColumn">カラムをトグル</a>
    <div class="memos column-base">
        <memo :memo="memo" v-for="memo in memos" :key="memo.id"></memo>
    </div>
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
      size: 50,
      isTwoColumn: true,
      masonry: Object,
      isFirstUpdated: true,
      masonry: Object
    }
  },
  mounted () {
    this.get_memos()

    window.addEventListener('resize', this.onResize)
  },
  updated () {
    this.masonry = new MiniMasonry({
      container: '.memos',
      minify: false,
      gutter: 20,
      baseWidth: 400
    })

    this.masonry.layout()

    // Ctrl + Shift + Rでリロードするとレイアウトが崩れるためlayoutを再実行する
    // _media.vueで再実行したあとに行う必要があるため、相手の秒数よりあとにしなければならない
    this.setExecuteLayout(100)

    window.addEventListener('resize', () => {
      this.setExecuteLayout(150)
    })
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
    },
    setExecuteLayout: function (delay) {
      window.setTimeout( () => {
        this.masonry.layout()
      }, delay)
    }
  },
  components: {
    Memo
  }
}
</script>

<style scoped>
.column-base {
  width: 100%;
  position: relative;
}

</style>
