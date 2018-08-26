<template>
  <div id="app">
    <header-component />
    <router-view />
    <footer-component />
  </div>
</template>

<script>
import HeaderComponent from './components/Layout/Header'
import FooterComponent from './components/Layout/Footer'

export default {
  name: 'App',
  components: {
    HeaderComponent,
    FooterComponent,
  },
}
</script>

<style scoped>
</style>
