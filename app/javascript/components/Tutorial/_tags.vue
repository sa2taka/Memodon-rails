<template>
  <div id="tags">
    <div class="tutorial-frame blue-grey darken-2">
      <div class="tutorial-title">
        タグでまとめて思い出を見返そう!!
      </div>

      <div class="memos-area flex-center">
        <toot class="tag1" :toot="memo" :hasImage="true" :style="{ left: index * 12 + 'px', top: index * 60 + 'px' }" v-for="(memo, index) in memos1"></toot>
      </div>

      <div class="memos-area flex-center" style="left: 400px">
        <toot class="tag2" :toot="memo" :hasImage="true" :style="{ left: index * 12 + 'px', top: index * 60 + 'px' }" v-for="(memo, index) in memos2"></toot>
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
      memos1: [
                '#メモ #4/16もくもく会<br />楽しかった!',
                '#メモ #4/16もくもく会<br />晩飯はみんなでお好み焼き',
                '#メモ #4/16もくもく会<br />ちょっとしたLTタイム',
                '#メモ #4/16もくもく会<br />今日のまとめ',
              ],
      memos2: [
                '#メモ #11/17お誕生日会<br />一人でした。',
                '#メモ #11/17お誕生日会<br />やっぱり一人でした。',
                '#メモ #11/17お誕生日会<br />それでも一人でした。',
                '#メモ #11/17お誕生日会<br />結局一人でした。',
              ]
    }
  },
  mounted () {
    const tag1Memos = document.querySelectorAll('.tag1')
    const tag2Memos = document.querySelectorAll('.tag2')
    let delay = 500

    tag1Memos.forEach( (memo) => {
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

    delay = 1200

    tag2Memos.forEach( (memo) => {
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
  position: relative;
  width: 45%;
}

.memo-area {
  width: 100%;
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

.tag1, .tag2 {
  position: absolute;
}
</style>
