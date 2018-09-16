<template>
  <div class="tag">
    <div class="tag__title">
      #{{ tag.name }}
    </div>

    <div class="tag__status" v-html="formattedText">
    </div>

    <div class="tag__count">
      {{tag.count}} Toot{{ tag.count > 1 ? 's' : '' }}
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'tags',
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
      console.log(text)
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
  width: 19rem;
  border: solid 2px black;
  overflow-wrap: break-word;
  overflow: hidden;
  margin: 1rem;
  padding: 1rem;
}

.tag__title {
  font-size: 1.5em;
  font-weight: 600;
  color: rgb(0, 178, 255);
}

.tag__status {
  font-size: 12px;
  height: 68px;
  overflow: hidden;
}

.tag__count {
  font-size: 12px;
  margin-top: 1em;
  margin-bottom: 1em;
}

.tag__status > p {
  margin: 18px 0;
}
</style>
