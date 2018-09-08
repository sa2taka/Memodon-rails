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
      this.$router.push(location.href.replace(this.foundationUrl, ''))
    })
  }
}
</script>

<style scoped>
</style>
