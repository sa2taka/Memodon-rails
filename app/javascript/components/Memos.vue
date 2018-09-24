<template>
  <div id="memos" >
    <memos-bar @toggleColumn="toggleMultiColumn"></memos-bar>

    <transition name="memos">
      <multi-column-memos :memos="memos" v-if="isMultiColumn" @delete_memo="onDeteleMemo"></multi-column-memos>
      <one-column-memos :memos="memos" v-else @delete_memo="onDeteleMemo"></one-column-memos>
    </transition>
  </div>
</template>

<script>
import MultiColumnMemos from './Memos/_multi_column_memos'
import OneColumnMemos from './Memos/_one_column_memos'
import MemosBar from './Memos/_memos_bar.vue'
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
    get_memos: function () {
      const params = {
        page:     this.page,
        size:     this.size,
        tag_name: this.$route.params.tagname
      }
      const self = this
      this.memos = []
      axios.get('/api/memos', { params })
      .then(function(response) {
        if (response.data.error_type && response.data.error_type === 'invalid_login') {
          location.href = '/login'
        }
        self.memos = response.data
        self.$forceUpdate()
      })
    },
    toggleMultiColumn: function () {
      this.isMultiColumn = !this.isMultiColumn
    },
    back_to_tags: function () {
      location.href = "/#/tags"
    },
    onDeteleMemo: function () {
      this.get_memos()
    }
  },
  computed: {
  },
  watch: {
    '$route' (_) {
      this.get_memos()
    }
  },
  components: {
    MultiColumnMemos,
    OneColumnMemos,
    MemosBar
  }
}
</script>

<style scoped>
.column-switch {
  font-size: 22px;
  font-weight: 600;
  color: rgb(51, 51, 51);
}

.back_to_tags {
  cursor: pointer;
}

.back_to_tags:hover {
  text-decoration: underline;
}
</style>
