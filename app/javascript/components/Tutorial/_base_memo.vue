<template>
  <div id="base_memo">
    <div class="tutorial-frame blue-grey darken-2">
      <div class="tutorial-title">
        Memodonを開いてメモを確認しよう!!
      </div>

      <div class="memos-area flex-center">
        <toot :toot="memo"  v-for="memo in memos"></toot>
      </div>
    </div>
  </div>
</template>

<script>
import Toot from './_toot'

export default {
  name: 'base_memo',
  data () {
    return {
      memos: [
              '#メモ <br />Memodonはいいぞ。',
              '#メモ <br />11/17は将棋の日',
              '#メモ <br />#Rails <br />Rails6で複数DB接続サポート',
              '#メモ <br />#4/16もくもく会オフ<br />焼き肉なう。'
             ]
    }
  },
  mounted () {
    const memos = document.querySelectorAll('.memo-area')
    let delay = 500

    memos.forEach( (memo) => {
      memo.animate({
        transform: [ 'translateY(200px)', 'translateY(0px)' ],
        opacity:   [ 0, 1 ]
      },
      {
        duration: 500,
        delay: delay,
        easing: 'ease',
        fill: 'forwards'
      })
      delay += 100
    })
  },
  components: {
    Toot
  }
}
</script>

<style scoped>
.memos-area {
  width: 90%;
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
</style>
