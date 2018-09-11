<template>
  <div id="medium">
    <img class="materialboxed thumbnail z-depth-3" :src="medium.url">
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
  }
}
</script>

<style scoped>
#medium {
  box-sizing: border-box;
  position: relative;
  margin: 4px 6px;
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
