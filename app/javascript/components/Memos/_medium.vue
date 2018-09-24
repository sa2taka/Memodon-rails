<template>
  <div class="medium">
    <img class="thumbnail z-depth-3" :src="medium.url" @click="setImageUrl" :style="getMaxWidthAndHeightStyle()">
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
    isOneColumn: {
      type: Boolean
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
    },
    getMaxWidthAndHeightStyle: function () {
      return {
        'max-width': this.isOneColumn ? '224px' : null,
        'max-height': this.isOneColumn ? '224px' : null
      }
    }
  }
}
</script>

<style scoped>
.medium {
  margin: .5rem;
  display: flex;
  align-items: flex-end;
}

.thumbnail {
  max-width: 168px;
  max-height: 168px;
  width: auto;
  height: auto;
  background-color: white;
  padding: 6px;
}

@media (min-width: 1506px) {
  .thumbnail {
    max-width: 124px;
    max-height: 124px;
  }
}
</style>
