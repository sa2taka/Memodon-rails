<template>
  <div id="memos">
    This is Memos.
    <a class="btn" @click="_test_crawl">クロール</a>
  </div>
</template>

<script>
export default {
  name: 'memos',
  methods: {
    _test_crawl: function () {
      const xhr = new XMLHttpRequest()
      const url = 'http://localhost:3000/memo/crawl'
      xhr.open('post', url, true)
      xhr.send()
    }
  }
}
</script>

<style scoped>
</style>
