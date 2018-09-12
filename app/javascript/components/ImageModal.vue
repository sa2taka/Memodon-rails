<template>
  <div id="image-modal">
    <div class="image-area flex-center ">
      <img class="image" :src="imageUrl" />
    </div>
  </div>
</template>

<script>
export default {
  name: 'modal',
  props: {
    imageUrl: String
  },
  data () {
    return {
    }
  },
  mounted () {
    document.getElementById('image-modal').addEventListener('click', (e) => {
      this.$store.commit('setImageUrl', '')
    })
  }
}
</script>

<style scoped>
#image-modal {
  position: fixed;
  background-color: rgba(0, 0, 0, 0.85);
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  z-index: 9999;
}

.image-area {
  position: relative;
  width: 100vw;
  height: 100vh;
}

.image {
  max-width: 80%;
  max-height: 80%;
}
</style>
