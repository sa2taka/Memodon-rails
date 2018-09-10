<template>
  <div id="media">
    <medium :medium="media[0]" :width="240"></medium>
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
#media {
  margin: 1rem;
}
</style>
