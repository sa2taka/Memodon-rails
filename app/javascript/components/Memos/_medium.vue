<template>
  <div id="medium">
    <img class="materialboxed" :width="width" :src="medium.url">
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
    width: {
      type: Number,
      required: true
    }
  },
  mounted () {
    const elems = document.querySelectorAll('.materialboxed')
    const options = {}
    console.log(this.medium)
    this.instances = M.Materialbox.init(elems, options)
    console.log(this.instances)
  },
  methods: {
  }
}
</script>

<style scoped>
</style>
