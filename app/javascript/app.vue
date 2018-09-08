<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>

export default {
  name: 'App',
  data () {
    return {
      foundationUrl: ''
    }
  },
  mounted() {
    this.foundationUrl = location.href.match(/http:\/\/.*?\/#\//gi)[0]
    window.addEventListener('popstate', (e) =>  {
      const applicationElement = document.getElementById('application')
      if (e.state) {
        this.$router.go({ path: location.href.replace(this.foundationUrl, '') })
      }
    })
  }
}
</script>

<style scoped>
</style>
