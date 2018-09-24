<template>
  <div id="tags">
    <div class="title">最近呟いたタグ</div>
    <hr class="title-line" />
    <div class="tag-area">
      <tag :tag="tag" v-for="tag in tags['recent_tags']" :key="tag.name"></tag>
      <div class="empty" v-for="n in 10"></div>
    </div>

    <div class="title">最も多く呟いてるタグ</div>
    <hr class="title-line" />
    <div class="tag-area">
      <tag :tag="tag" v-for="tag in tags['most_tags']" :key="tag.name"></tag>
      <div class="empty" v-for="n in 10"></div>
    </div>

    <div class="title">全てのタグ</div>
    <hr class="title-line" />
    <div class="tag-area">
      <tag :tag="tag" v-for="tag in tags['user_tags']" :key="tag.name"></tag>
      <div class="empty" v-for="n in 10"></div>
    </div>
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
  computed: {
  },
  methods: {
    get_tags: function () {
      const self = this
      axios.get('/api/tags', { })
      .then(function(response) {
        self.tags = response.data
      })
    },
  },
  components: {
    Tag
  }
}
</script>

<style>
.tag-area {
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

.empty {
  width: 18rem;
  visibility: hidden;
  margin: 0.2rem;
}

.title {
  position: relative;
  font-size: 24px;
  font-weight: 600;
  left: 2em;
}

.title-line {
  border: 0;
  height: 2px;
  background-color: #aaaaaa;
  margin: 0;
}
</style>
