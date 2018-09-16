<template>
  <div class="memos-bar row">
    <a class="back_to_tags" @click="back_to_tags" v-if="isTagMemos">&lt;&lt;タグ一覧へ</a>
    <a class="btn col offset-s1 s2" @click="_test_crawl">クロール</a>
    <div class="switch col offset-s3 s5">
      <label class="column-switch">
        単独カラム
        <input type="checkbox" checked @click="$emit('toggleColumn')">
        <span class="lever"></span>
        複数カラム
      </label>
    </div>
  </div>
</template>

<script>
export default {
  name: 'memos_bar',
  data () {
    return {
    }
  },
  mounted () {
  },
  methods: {
    _test_crawl: function () {
      const xhr = new XMLHttpRequest()
      const url = 'http://localhost:3000/memo/crawl'
      xhr.open('post', url, true)
      xhr.send()
    },
    back_to_tags: function () {
      location.href = "/#/tags"
    }
  },
  computed: {
    isTagMemos: function () {
      return location.href.match(/tag/)
    }
  },
  watch: {
  },
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
