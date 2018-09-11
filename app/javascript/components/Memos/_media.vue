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
      instance: Object
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
    console.log('#media-' + this.memo_id)
    new MiniMasonry({
      container: '#media-' + this.memo_id,
      baseWidth: 167,
      minify: false
    })
  },
  methods: {
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
