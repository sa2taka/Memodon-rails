<template>
  <div id="app">
    <router-view />
    <image-modal v-if="isImageModalActive" :imageUrl="imageUrl"></image-modal>
  </div>
</template>

<script>
import ImageModal from './components/ImageModal'

export default {
  name: 'App',
  data () {
    return {
      foundationUrl: '',
    }
  },
  computed: {
    isImageModalActive: function () {
      return this.imageUrl.match(/https?:\/\//gi)
    },
    imageUrl: function () {
      return this.$store.state.imageUrl
    }
  },
  mounted() {
    this.foundationUrl = location.href.match(/https?:\/\/.*?\/#\//gi)[0]
    window.addEventListener('popstate', (e) =>  {
      const applicationElement = document.getElementById('application')
      if (e.state) {
        this.$router.go({ path: location.href.replace(this.foundationUrl, '') })
      }
    })
  },
  components: {
    ImageModal
  }
}
</script>

<style scoped>
</style>
