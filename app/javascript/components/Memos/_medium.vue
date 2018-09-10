<template>
  <div id="medium">
    <div :style="img_style">
      <img class="materialboxed thumbnail z-depth-3" :src="medium.url">
    </div>
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
    },
    img_style: {
      type: String,
      required: true
    }
  },
  mounted () {
    const elems = document.querySelectorAll('.materialboxed')
    const options = {}
    this.instance = M.Materialbox.init(elems, options)[0]
  },
  methods: {
  }
}
</script>

<style scoped>
#medium {
  box-sizing: border-box;
  position: relative;
  width: 100%;
  overflow: hidden;
  margin-top: 8px;
}

.thumbnail {
  max-width: 240px;
  max-height: 240px;
  width: auto;
  height: auto;
}
</style>
