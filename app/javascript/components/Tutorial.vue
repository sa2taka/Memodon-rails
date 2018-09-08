<template>
  <div id="tutorial" class="tutorial-area full-screen">
    <div class="tutorial-top">
      <div class="carousel carousel-slider center full-screen" style="height: 100%;">
        <div class="carousel-item" href="#one!">
          <transition name="base">
            <base-toot class="tutorial-slide__content full-screen" v-if="isCenter(0)"></base-toot>
          </transition>
        </div>
        <div class="carousel-item" href="#two!">
          <transition name="base">
            <base-memo class="tutorial-slide__content full-screen" href="#two!" v-if="isCenter(1)"></base-memo>
          </transition>
        </div>
        <router-link to="/memos">
          <div class="btn waves-light btn-large to-memo-button">今すぐメモ一覧へ</div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import BaseToot from './Tutorial/_base_toot'
import BaseMemo from './Tutorial/_base_memo'

export default {
  name: 'tutorial',
  data () {
    return {
      // Tutorialの並び順と名前
      carouselElms: [],
      carouselInstance: Object()
    }
  },
  mounted () {
    const options = { noWrap: true, indicators: true, fullWidth: true }
    const elms = document.querySelectorAll('.carousel')
    this.carouselElms = elms
    this.carouselInstance = M.Carousel.init(elms, options)[0]
  },
  computed: {
  },
  methods: {
    isCenter: function (num) {
      if (this.carouselInstance.center === undefined) {
        return true
      }
      return num === this.carouselInstance.center
    }
  },
  components: {
    BaseToot,
    BaseMemo,
  }
}
</script>

<style scoped>
.tutorial-area {
  margin: auto;
  z-index: -1;
}

.tutorial-top {
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;

  -webkit-box-pack: space-between;
  -ms-flex-pack: space-between;
  -webkit-justify-content: space-between;
  justify-content: space-between;

  position: relative;
  width: 100%;
  height: 100%;
}

.arrow {
  width: 48px;
  transition: all .5s ease;
}

.row-center {
  display: flex;
  height: 100%;
}

.slide-window {
  width: 100%;
  height: 100%;
  flex: 1;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  z-index: -1;
}

.tutorial-slide {
  width: 100%;
  height: 100%;
  position: relative;
  display: inline-block;
  transition: all 1.0s ease;
}

.tutorial-slide__content {
  /* width: 100%;
  height: 100%;
  display: inline;
  text-align: center; */
  transition: opacity 1.2s ease;
}


.carousel {
  height: 100%!important;
}

.clear {
  opacity: 0;
}

.to-memo-button {
  position: absolute;
  bottom: 10%;
  transform: translateX(-90px);
}

.base-enter-active, .base-leave-active {
  transition: opacity 1.0s;
}
.base-enter, .base-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}

</style>
