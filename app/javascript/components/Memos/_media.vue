<template>
  <div id="media">
    <medium :medium="media[0]" :img_style="'left: auto; top: auto; right: auto; bottom: auto; width: 100%; height: 100%;'"></medium>
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
