<template>
  <div id="tutorial" class="tutorial-area">
    <div class="tutorial-top flex-center">
      <div class="carousel carousel-slider center" style="height: 100%;">

        <div class="carousel-item flex-center" href="#one!">
          <transition name="base">
            <base-toot class="tutorial-slide__content" v-if="isCenter(0)"></base-toot>
          </transition>
        </div>

        <div class="carousel-item flex-center" href="#two!">
          <transition name="base">
            <base-memo class="tutorial-slide__content" href="#two!" v-if="isCenter(1)"></base-memo>
          </transition>
        </div>

        <router-link to="/memos">
          <div class="btn waves-light btn-large to-memo-button">今すぐメモ一覧へ</div>
        </router-link>

        <div :class="['arrow-area', 'arrow-area__back', 'flex-center', { 'clear': isFirst }]" @click="prevCarousel()">
          <div class="arrow-area__base arrow-area__base__back flex-center">
            <i class="medium material-icons arrow">arrow_back</i>
          </div>
        </div>

        <div :class="['arrow-area', 'arrow-area__next', 'flex-center', { 'clear': isLast }]" @click="nextCarousel()">
          <div class="arrow-area__base arrow-area__base__next flex-center">
            <i class="medium material-icons arrow">arrow_forward</i>
          </div>
        </div>
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
      carouselElmsNum: 2,
      isFirstContentLoad: true
    }
  },
  mounted () {
    const options = { noWrap: true, indicators: true, fullWidth: true }
    const elms = document.querySelectorAll('.carousel')
    this.carouselElms = elms
    this.carouselInstance = M.Carousel.init(elms, options)[0]
  },

  computed: {
    isFirst () {
      // ここで this.carouselInstance.center を登場させないとcenterが変化してもこのisFirstが更新されない
      // FIXME: この部分をもう少し賢く修正したい
      this.carouselInstance.center

      if (this.isFirstContentLoad) {
        this.isFirstContentLoad = false
        return true
      }
      return this.carouselInstance.center === 0
    },
    isLast () {
      return this.carouselInstance.center === this.carouselElmsNum - 1
    }
  },
  methods: {
    isCenter: function (num) {
      if (this.carouselInstance.center === undefined) {
        return true
      }
      return num === this.carouselInstance.center
    },
    prevCarousel: function () {
      if (!this.isFirst) {
        this.carouselInstance.prev()
      }
    },
    nextCarousel: function () {
      if (!this.isLast) {
        this.carouselInstance.next()
      }
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
  position: fixed;
  background-color: rgba(0, 0, 0, 0.85);
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  z-index: 9999;
}

.tutorial-top {
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
  width: 860px;
  height: 570px;
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

.arrow-area {
  position: fixed;
  color: white;
  width: 30%;
  height: 100%;
  transition: all .5s ease;
  cursor: pointer;
}

.arrow-area__back {
  left: calc(50% - 660px);
  left: -webkit-calc(50% - 660px);
}

.arrow-area__back:hover {
  left: calc(50% - 660px);
  left: -webkit-calc(50% - 660px);
}

.arrow-area__next {
  right: calc(50% - 660px);
  right: -webkit-calc(50% - 660px);
}

.arrow-area__next:hover {
  right: calc(50% - 660px);
  right: -webkit-calc(50% - 660px);
}

.arrow {
  position: relative;
}

.arrow-area__base {
  position: absolute;
  height: 72px;
  width: 72px;
  border-radius: 50%;
  background-color: rgb(14, 107, 59);
  text-align: center;
  line-height: 72px;
  justify-content: center;
}


.base-enter-active, .base-leave-active {
  transition: opacity 1.0s;
}
.base-enter, .base-leave-to {
  opacity: 0;
}

.arrow-enter, .arrow-enter-active{
  transition: all .5s ease-out;
}

.arrow-enter, .arrow-leave-to, .arrow-enter:hover, .arrow-leave-to:hover {
  opacity: 0;
}


</style>
