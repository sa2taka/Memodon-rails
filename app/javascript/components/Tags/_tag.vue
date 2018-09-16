<template>
  <div class="tag">
    <div class=" card z-depth-2 tag__card">
      <router-link class="tag__title" :to="{ name: 'tag', params: { tagname: tag.name} }">
        #{{ tag.name }}
      </router-link >

      <div class="tag__status " v-html="formattedText">
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'tag',
  props: {
    tag: {
      type: Object,
      required: true
    }
  },
  date () {
    return {
      aTagTextLength: 20,
      AllTextLength: 50,
      afterText: '...'
    }
  },
  mounted () {
  },
  computed: {
    formattedText: function () {
      let formatted = this.tag.text
      formatted = this.deleteTag(formatted)
      return formatted
    }
  },
  methods: {
    deleteTag: function(text) {
      return text.replace(/<a href="[^"]*?" class="mention hashtag"\s*rel="tag">#<span>.*?<\/span><\/a>(\s*<br \/>)?/ig, '')
    },
    deleteHeadBr: function(text) {
      return text.replace(/<p>\s*<br>/ig, '<p>')
    }
  }
}
</script>

<style>
.tag {
  width: 18rem;
  overflow-wrap: break-word;
  overflow: hidden;
  padding: 4px;
  margin: 0.2rem;
}

.tag__card {
  padding: 1rem;
}

.tag__title {
  font-size: 1.5em;
  font-weight: 600;
}

.tag__status {
  font-size: 12px;
  height: 90px;
  overflow: hidden;
  margin-bottom: 1rem;
}

.tag__status > p {
  margin: 18px 0;
}
</style>
