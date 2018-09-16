<template>
  <div id="tags">
    <tag :tag="tag" v-for="tag in tags" :key="tag.name"></tag>
  </div>
</template>

<script>
import Tag from './Tags/_tag'
import axios from 'axios'

export default {
  name: 'tags',
  data () {
    return {
      tags: [],
    }
  },
  mounted () {
    this.get_tags()
  },
  methods: {
    get_tags: function () {
      const self = this
      axios.get('/api/tags', { })
      .then(function(response) {
        self.tags = response.data
        self.$forceUpdate()
      })
    },
  },
  components: {
    Tag
  }
}
</script>

<style scoped>
#tags {
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  flex-wrap: wrap;
}
</style>
