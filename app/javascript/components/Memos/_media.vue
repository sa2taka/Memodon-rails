<template>
  <div :id="'media-' + memo_id" class="media" :style="{ 'max-width': `${200 * media.length}px` }">
    <medium :medium="medium" v-for="medium in media"></medium>
  </div>
</template>

<script>
import Medium from './_medium.vue'
export default {
  name: 'media',
  data () {
    return {
      masonry: Object
    }
  },
  props: {
    media: {
      type: Array,
      required: true
    },
    memo_id: {
      type: Number,
      required: true
    }
  },
  mounted () {
    this.masonry = new MiniMasonry({
      container: '#media-' + this.memo_id,
      baseWidth: 167,
      minify: false
    })

    // Ctrl + Shift + Rでリロードするとレイアウトが崩れるためlayoutを再実行する
    // Memos.vueで再実行した前に行う必要があるため、それより早い秒数で行う
    this.setExecuteLayout(66)

    window.addEventListener('resize', () => {
      this.setExecuteLayout(100)
    })
  },
  methods: {
    setExecuteLayout: function (delay) {
      window.setTimeout( () => {
        this.masonry.layout()
      }, delay)
    }
  },
  components: {
    Medium
  }
}
</script>

<style scoped>
.media {
  margin: 1rem;
  display: flex;
  flex-wrap: wrap;
}
</style>
