<template>
  <div id="media" class="media" :style="{ 'max-width': `${(isOneColumn ? 256 : 200) * media.length}px` }">
    <medium :medium="medium" v-for="medium in media" :isOneColumn="isOneColumn" :key="medium.id"></medium>
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
    },
    isOneColumn: {
      type: Boolean
    }
  },
  mounted () {
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
  padding: 5px;
  width: 90%;
  display: flex;
  flex-wrap: wrap;
}
</style>
