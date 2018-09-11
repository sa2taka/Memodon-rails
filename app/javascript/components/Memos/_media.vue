<template>
  <div id="media">
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
  display: flex;
  flex-wrap: wrap;
}
</style>
