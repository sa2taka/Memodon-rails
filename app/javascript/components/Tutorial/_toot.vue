<template>
  <div class="memo-area">
    <div class="card orange lighten-3">
      <div class="card-content black-text">
        <div class="status-content">
          <div>
            <p v-html="toot"></p>
          </div>
        </div>
        <div class="gallery" v-if="hasImage">
          <i class="medium material-icons">image</i>
          <i class="medium material-icons">image</i>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'toot',
  props: {
    toot: '',
    hasImage: false
  }
}
</script>

<style scoped>
.memo-area {
  width: 40%;
  margin: 5px;
  opacity: 0;
}

.status-content {
  font-weight: 400;
  font-size: 14px;
  word-break: break-all;
  background-image: linear-gradient(90deg, rgba(0, 0, 0, 0)), linear-gradient(180deg, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0) 98.5%, rgba(100, 100, 100, 100) 100%);
  background-image: linear-gradient(90deg, rgba(0, 0, 0, 0)), linear-gradient(180deg, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0) 98.5%, rgba(82, 52, 200, 0.8) 100%);
  background-repeat: repeat-x, repeat-y;
  background-size: 4px 100%, 100% 2rem;
  background-size: auto 2rem;
  line-height: 2rem;
}

.status-content > p {
  margin-bottom: 2rem;
}

.gallery {
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  flex-wrap: wrap;
  margin: auto;
  -webkit-box-pack: space-around;
  -ms-flex-pack: space-around;
  -webkit-justify-content: space-around;
  justify-content: space-around;
}
</style>
