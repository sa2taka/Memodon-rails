<template>
  <div id="base_toot">
    <div class="tutorial-frame blue-grey darken-2">
      <div class="tutorial-title">
        ハッシュタグ「#メモ」をつけてTootしよう!!
      </div>
      <div class="toot-area">
        #メモ Memodonはいいぞ。
      </div>

      <div>
        <a class="btn toot-button">トゥート！</a>
      </div>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: 'base_toot',
  mounted () {
    const toot   = document.querySelector('.toot-area')
    const button = document.querySelector('.toot-button')

    toot.animate({
      transform: [ 'translateX(-200px)', 'translateX(0px)' ],
      opacity:   [ 0, 1 ]
    },
    {
      duration: 500,
      delay: 500,
      easing: 'ease',
      fill: 'forwards'
    })

    button.animate({
      transform: [ 'translateY(100px)', 'translateY(0px)' ],
      opacity:   [ 0, 1 ]
    },
    {
      duration: 500,
      delay: 800,
      easing: 'ease',
      fill: 'forwards',
      fill: 'forwards'
    })
  }
}
</script>

<style scoped>
.mstdn-background {
  background-color: rgb(40, 44, 55);
}

.toot-area {
  position: relative;
  min-height: 100px;
  width: 60%;
  background-color: white;
  border-radius: 12px;
  padding-bottom: 0;
  padding-left: 1em;
  padding-right: 1em;
  resize: none;
  display: inline-block;
  text-align: left;
  margin: 2em;
  padding: 12px;
  opacity: 0;
}

.toot-button {
  position: relative;
  left: 20%;
  background-color: #2b90d9;
  border-radius: 4px;
  opacity: 0;
}

.toot-button:hover {
  background-color: #2b90d9;
  -webkit-box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14), 0 3px 1px -2px rgba(0,0,0,0.12), 0 1px 5px 0 rgba(0,0,0,0.2);
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.14), 0 3px 1px -2px rgba(0,0,0,0.12), 0 1px 5px 0 rgba(0,0,0,0.2);
}

.toot-button__hover {
  background-color: #56a7e1;
  -webkit-box-shadow: 0 3px 3px 0 rgba(0,0,0,0.14), 0 1px 7px 0 rgba(0,0,0,0.12), 0 3px 1px -1px rgba(0,0,0,0.2);
  box-shadow: 0 3px 3px 0 rgba(0,0,0,0.14), 0 1px 7px 0 rgba(0,0,0,0.12), 0 3px 1px -1px rgba(0,0,0,0.2);
}

</style>
