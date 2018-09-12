<template>
  <div class="medium">
    <img class="thumbnail z-depth-3" :src="medium.url" @click="setImageUrl">
  </div>
</template>

<script>
export default {
  name: 'medium',
  data () {
    return {
      instance: Object
    }
  },
  props: {
    medium: {
      type: Object,
      required: true
    }
  },
  mounted () {
    const elems = document.querySelectorAll('.materialboxed')
    const options = {}
    this.instance = M.Materialbox.init(elems, options)[0]
  },
  methods: {
    setImageUrl: function () {
      this.$store.commit('setImageUrl', this.medium.url)
    }
  }
}
</script>

<style scoped>
.medium {
  position: absolute;
  box-sizing: border-box;
  margin: 4px 6px;
  min-height: 168px;
}

.thumbnail {
  max-width: 168px;
  max-height: 168px;
  width: auto;
  height: auto;
  background-color: white;
  padding: 6px;
}

</style>
