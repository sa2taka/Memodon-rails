<template>
  <div id="memos" >
    <div class="row">
      <a class="btn col offset-s1 s2" @click="_test_crawl">クロール</a>
      <div class="switch col offset-s3 s5">
        <label class="column-switch">
          単独カラム
          <input type="checkbox" checked @click="toggleMulctiColumn">
          <span class="lever"></span>
          複数カラム
        </label>
      </div>
    </div>

    <transition name="memos">
      <multi-column-memos :memos="memos" v-if="isMultiColumn"></multi-column-memos>
      <one-column-memos :memos="memos" v-else></one-column-memos>
    </transition>
  </div>
</template>

<script>
import MultiColumnMemos from './Memos/_multi_column_memos'
import OneColumnMemos from './Memos/_one_column_memos'
import axios from 'axios'

export default {
  name: 'memos',
  data () {
    return {
      memos: [],
      page: 1,
      size: 50,
      isMultiColumn: true
    }
  },
  mounted () {
    this.get_memos()
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
    toggleMulctiColumn: function () {
      this.isMultiColumn = !this.isMultiColumn
    }
  },
  components: {
    MultiColumnMemos,
    OneColumnMemos
  }
}
</script>

<style scoped>
.column-switch {
  font-size: 22px;
  font-weight: 600;
  color: rgb(51, 51, 51);
}
</style>
