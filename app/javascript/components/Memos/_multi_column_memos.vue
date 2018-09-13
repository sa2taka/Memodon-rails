<template>
  <div class="memos column-base">
    <memo :memo="memo" v-for="memo in memos" :key="memo.id"></memo>
  </div>
</template>

<script>
import Memo from './_memo'

export default {
  name: 'multi-column-memo',
  props: {
    memos: {
      type: Array,
      require: true
    }
  },
  data () {
    return {
      masonry: Object,
    }
  },
  mounted () {
    this.masonry = new MiniMasonry({
      container: '.memos',
      minify: false,
      gutter: 20,
      baseWidth: 400
    })
    this.setExecuteLayout(80)
  },
  updated () {
    this.masonry = new MiniMasonry({
      container: '.memos',
      minify: false,
      gutter: 20,
      baseWidth: 400
    })

    this.masonry.layout()

    // Ctrl + Shift + Rでリロードするとレイアウトが崩れるためlayoutを再実行する
    // _media.vueで再実行したあとに行う必要があるため、相手の秒数よりあとにしなければならない
    this.setExecuteLayout(100)

    window.addEventListener('resize', () => {
      this.setExecuteLayout(150)
    })
  },
  methods: {
    setExecuteLayout: function (delay) {
      window.setTimeout( () => {
        this.masonry.layout()
      }, delay)
    }
  },
  components: {
    Memo
  }
}
</script>

<style scoped>
.column-base {
  width: 100%;
  position: relative;
}

.memos > * {
  position: absolute;
}

</style>
