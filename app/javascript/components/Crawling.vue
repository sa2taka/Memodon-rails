<template>
  <div id="crawling">
    <i class="material-icons loading">autorenew</i>
    メモを取得中...
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'crawling',
  data () {
    return {
    }
  },
  mounted () {
    this.crawl()
    setTimeout(this.judge, 500)
  },
  methods: {
    crawl: function () {
      const xhr = new XMLHttpRequest()
      const url = '/memo/crawl'
      xhr.open('post', url, true)
      xhr.send()
    },
    judge: function () {
      const self = this
      axios.get('/api/is_crawling', { })
      .then(function(response) {
        const is_crawling = response.data.answer
        if (is_crawling) {
          setTimeout(self.judge, 2000)
        }
        else {
          const url = self.$store.state.beforeCrawlingUrl
          if (url) {
            location.href = self.$store.state.beforeCrawlingUrl
          }
          else {
            self.$router.push({name: 'home'})
          }
        }
      })
    }
  },
  computed: {
  },
  watch: {
  },
}
</script>

<style scoped>
.loading {
  -webkit-animation: spin 1.5s linear infinite;
  -moz-animation: spin 1.5s linear infinite;
  -ms-animation: spin 1.5s linear infinite;
  -o-animation: spin 1.5s linear infinite;
  animation: spin 1.5s linear infinite;
}

@-webkit-keyframes spin {
  0% {-webkit-transform: rotate(0deg);}
  100% {-webkit-transform: rotate(360deg);}
}
@-moz-keyframes spin {
  0% {-moz-transform: rotate(0deg);}
  100% {-moz-transform: rotate(360deg);}
}
@-ms-keyframes spin {
  0% {-ms-transform: rotate(0deg);}
  100% {-ms-transform: rotate(360deg);}
}
@-o-keyframes spin {
  0% {-o-transform: rotate(0deg);}
  100% {-o-transform: rotate(360deg);}
}
@keyframes spin {
  0% {transform: rotate(0deg);}
  100% {transform: rotate(360deg);}
}

#crawling {
  font-size: 24px;
  text-align: center;
  margin: 24px;
}
</style>
