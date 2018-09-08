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
        <transition name="arrow-back">
          <div class="arrow-area arrow-area__back" v-if="carouselInstance.center !== 0"  @click="carouselInstance.prev()">
            <div class="arrow-area__base arrow-area__base__back green darken-1">
              <i class="medium material-icons arrow">arrow_back</i>
            </div>
          </div>
        </transition>

        <transition name="arrow-next">
          <div class="arrow-area arrow-area__next" v-if="carouselInstance.center !== carouselElmsNum - 1" @click="carouselInstance.next()">
            <div class="arrow-area__base arrow-area__base__next green darken-1">
              <i class="medium material-icons arrow">arrow_forward</i>
            </div>
          </div>
        </transition>
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
      carouselInstance: Object(),
      carouselElmsNum: 2
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
}

.arrow-area {
  position: fixed;
  color: white;
  width: 30%;
  height: 100%;
  transition: all .5s ease;
}

.arrow-area__back {
  left: 0;
  transform: translateX(-22%);
}

.arrow-area__back:hover {
  left: 0;
  transform: translateX(-10%);
}

.arrow-area__next {
  right: 0;
  transform: translateX(22%);
}

.arrow-area__next:hover {
  right: 0;
  transform: translateX(10%);
}


.arrow {
  position: relative;
  top: 45%;
}

.arrow-area__base {
  position: absolute;
  height: 100%;
  width: 60%;
}

.arrow-area__base__back{
  left: 0;
}

.arrow-area__base__next {
  right: 0;
}

.base-enter-active, .base-leave-active {
  transition: opacity 1.0s;
}
.base-enter, .base-leave-to {
  opacity: 0;
}

.arrow-back-enter, .arrow-back-enter-active{
  transition: all .5s ease-out;
}
.arrow-back-enter, .arrow-back-leave-to, .arrow-back-enter:hover, .arrow-back-leave-to:hover {
  transform: translateX(-100%)
}

.arrow-next-enter, .arrow-next-enter-active {
  transition: all .5s ease-out;
}
.arrow-next-enter, .arrow-next-leave-to, .arrow-next-enter:hover, .arrow-next-leave-to:hover {
  transform: translateX(100%)
}

</style>
