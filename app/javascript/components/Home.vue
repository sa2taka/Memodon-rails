<template>
  <div id="home">
    <div class="title-area">
      <div id="title" class="index-title ">
        <div class="index-title__x">
          <div class="index-title__y"></div>
        </div>
        <div class="index-title__content">
          <div class="index-title__content__base index-title__content__label">
            Memodon
          </div>
          <div class="index-title__content__base index-title__content__text">
            マストドンがメモ帳に
          </div>
          <div class="index-title__content__base index-title__content__icon">
            <i class="material-icons index-title__content__icon__content">mode_edit</i>
          </div>
        </div>
      </div>
    </div>
    <div class="link-area">
      <a class="waves-effect waves-light btn" href="/login">マストドンアカウントでログインする</a>
    </div>
  </div>
</template>

<script>
export default {
  name: 'home',
  mounted: function () {
    let titleArea= document.querySelector('#title')
    window.setTimeout(() => {
      titleArea.classList.add('z-depth-3')
      titleArea.classList.add('card')
    }, 1800)
  }
}
</script>

<style scoped>
.title-area {
  width: 100%;
  height: 300px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  position: relative;
  top: 60px;
}

.index-title {
    display: -webkit-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    -webkit-justify-content: center;
    justify-content: center;
    position: relative;
    width: 50vw;
    height: 280px;
    line-height: 200px;
    overflow: hidden;
    margin: 0;
    transition: all 0.4s ease-out;
}

.index-title__x:before, .index-title__x:after, .index-title__y:before, .index-title__y:after {
  content: '';
  position: absolute;
  background: #ee9b65;
}

.index-title__y:before {
  bottom: 0;
  right: -50vw;
  width: 50vw;
  height: 3px;
  -webkit-animation: topLine 0.4s ease 0.8s forwards;
  -moz-animation: topLine 0.4s ease 0.8s forwards;
  animation: topLine 0.4s ease 0.8s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.index-title__y:after {
  top: 0;
  left: -50vw;
  width: 50vw;
  height: 3px;
  -webkit-animation: bottomLine 0.4s ease 0s forwards;
  -moz-animation: bottomLine 0.4s ease 0s forwards;
  animation: bottomLine 0.4s ease 0s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.index-title__x:before {
  top: -280px;
  right: 0;
  width: 3px;
  height: 280px;
  -webkit-animation: rightLine 0.4s ease 0.4s forwards;
  -moz-animation: rightLine 0.4s ease 0.4s forwards;
  animation: rightLine 0.4s ease 0.4s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.index-title__x:after {
  bottom: -280px;
  left: 0;
  width: 3px;
  height: 280px;
  -webkit-animation: leftLine 0.4s ease 1.2s forwards;
  -moz-animation: leftLine 0.4s ease 1.2s forwards;
  animation: leftLine 0.4s ease 1.2s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.index-title__content {
  color: #ee9b65;
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
  flex-flow: column;
}

.index-title__content__base {
  height: 70px;
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  -webkit-box-align: center;
  -ms-flex-align: center;
  -webkit-align-items: center;
  align-items: center;
  position: relative;
}

.index-title__content__label {
  font-size: 42px;
  font-weight: 600;
}

.index-title__content__label:before {
  content: "";
  position: absolute;
  background: #fff;
  width: 100%;
  height: 100%;
  right: 0%;
  -webkit-animation: fadeFromLeft 0.4s linear 2s forwards;
  -moz-animation: fadeFromLeft 0.4s linear 2s forwards;
  animation: fadeFromLeft 0.4s linear 2s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.index-title__content__icon {
  position: absolute;
  top: 72px;
  left: 20%;
  opacity: 0;
  -webkit-transform: translateX(-50%);
  transform: translateX(-50%);
  -webkit-animation: penAnimation 1.6s linear 1.92s forwards;
  -moz-animation: penAnimation 1.6s linear 1.92s forwards;
  animation: penAnimation 1.6s linear 1.92s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.index-title__content__icon__content {
  font-size: 42px;
  color: #ffc38d;
}

.index-title__content__text {
  font-size: 24px;
}

.index-title__content__text:before {
  content: "";
  position: absolute;
  background: #fff;
  width: 100%;
  height: 100%;
  right: 0%;
  -webkit-animation: fadeFromLeft 0.4s linear 2.8s forwards;
  -moz-animation: fadeFromLeft 0.4s linear 2.8s forwards;
  animation: fadeFromLeft 0.4s linear 2.8s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

.link-area {
  position: relative;
  top: 80px;
  width: 100%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: center;
  -ms-flex-pack: center;
  -webkit-justify-content: center;
  justify-content: center;
  opacity: 0;
  -webkit-animation: fadeIn 1s ease 3.8s forwards;
  -moz-animation: fadeIn 1s ease 3.8s forwards;
  animation: fadeIn 1s ease 3.8s forwards;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
  animation-fill-mode: both;
}

@keyframes topLine {
  100% {
    right: 0;
  }
}

@-webkit-keyframes topLine {
  100% {
    right: 0;
  }
}

@-moz-keyframes topLine {
  100% {
    right: 0;
  }
}

@keyframes bottomLine {
  100% {
    left: 0;
  }
}

@-webkit-keyframes bottomLine {
  100% {
    left: 0;
  }
}

@-moz-keyframes bottomLine {
  100% {
    left: 0;
  }
}

@keyframes rightLine {
  100% {
    top: 0;
  }
}

@-webkit-keyframes rightLine {
  100% {
    top: 0;
  }
}

@-moz-keyframes rightLine {
  100% {
    top: 0;
  }
}

@keyframes leftLine {
  100% {
    bottom: 0;
  }
}

@-webkit-keyframes leftLine {
  100% {
    bottom: 0;
  }
}

@-moz-keyframes leftLine {
  100% {
    bottom: 0;
  }
}

@keyframes fadeFromLeft {
  100% {
    width: 0;
  }
}

@-webkit-keyframes fadeFromLeft {
  100% {
    width: 0;
  }
}

@-moz-keyframes fadeFromLeft {
  100% {
    width: 0;
  }
}

@keyframes penAnimation {
  10% {
    opacity: 1;
  }
  30% {
    left: 80%;
    top: 72px;
  }
  40% {
    top: 140px;
    left: 18%;
  }
  50% {
    top: 140px;
    left: 18%;
  }
  80% {
    top: 140px;
    left: 82%;
  }
  90% {
    top: 200px;
    left: 48%;
  }
  100% {
    top: 200px;
    left: 50%;
    opacity: 1;
  }
}

@-webkit-keyframes penAnimation {
  10% {
    opacity: 1;
  }
  30% {
    left: 80%;
    top: 72px;
  }
  40% {
    top: 140px;
    left: 18%;
  }
  50% {
    top: 140px;
    left: 18%;
  }
  80% {
    top: 140px;
    left: 82%;
  }
  90% {
    top: 200px;
    left: 48%;
  }
  100% {
    top: 200px;
    left: 50%;
    opacity: 1;
  }
}

@-moz-keyframes penAnimation {
  10% {
    opacity: 1;
  }
  30% {
    left: 80%;
    top: 72px;
  }
  40% {
    top: 140px;
    left: 18%;
  }
  50% {
    top: 140px;
    left: 18%;
  }
  80% {
    top: 140px;
    left: 82%;
  }
  90% {
    top: 200px;
    left: 48%;
  }
  100% {
    top: 200px;
    left: 50%;
    opacity: 1;
  }
}

@keyframes fadeIn {
  100% {
    opacity: 1;
  }
}

@-webkit-keyframes fadeIn {
  100% {
    opacity: 1;
  }
}

@-moz-keyframes fadeIn {
  100% {
    opacity: 1;
  }
}
</style>
