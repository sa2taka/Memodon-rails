<template>
  <div class="col s10 offset-s1">
    <div class="card orange lighten-3">
      <div class="card-content black-text">
        <div class="status-content">
          <div  v-html="memo.text"></div>
          <media :media="memo.media" :memo_id="memo.id" v-if="memo.media.length != 0"></media>
        </div>
        <div class="row actions">
          <div class="col s6 center action-column">
            <div class="go-to-toot">
              <a :href="memo.url" class="card-link">
                <i class="material-icons memo-link-icon ">subdirectory_arrow_right</i>
              </a>
            </div>
          </div>
          <div class="col s6 center action-column">
            <div class="delete-memo">
              <a class="card-link" :click="deleteMemo(memo.id)">
                <i class="material-icons memo-link-icon">delete_forever</i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Media from './_media.vue'
export default {
  name: 'memo',
  data () {
    return {
    }
  },
  props: {
    memo: {
      type: Object,
      required: true
    }
  },
  methods: {
    deleteMemo: function (id) {

    }
  },
  components: {
    Media
  }
}
</script>

<style scoped>
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


.actions {
  border-top: 1px solid rgba(156, 156, 156, 0.5);
  padding-top: 12px;
  margin-top: 24px;
  margin-bottom: 2px;
}

.card-link {
  color: black;
}

.go-to-toot, .delete-memo {
  cursor: pointer;
}

.delete-memo {
  transition: all, 0.2s
}

.delete-memo:hover {
  transform: scale(1.5, 1.5);
}

.go-to-toot:hover {
  -webkit-animation: goToToot 0.5s ease 0.2s infinite;
  -moz-animation: goToToot 0.5s ease 0.2s infinite;
  animation: goToToot 0.5s ease 0.2s infinite;
  -webkit-animation-fill-mode: both;
  -moz-animation-fill-mode: both;
}

.memo-link-icon {
  font-size: 24px;
}

.search-area {
  position: fixed;
  height: 80px;
  bottom: 6vh;
  left: 8vh;
  right: 8vh;
  border-radius: 8px;
  display: flex;
  align-items: center;
}

.empty-area {
  height: 25vh;
  width: 25vh;
}

@keyframes goToToot {
  0% {
    transform: translateX(0px);
  }
  50% {
    transform: translateX(20px);
  }
  100% {
    transform: translateX(0px);
  }
}

@-webkit-keyframes goToToot {
  0% {
    transform: translateX(0px);
  }
  50% {
    transform: translateX(20px);
  }
  100% {
    transform: translateX(0px);
  }
}

@-moz-keyframes goToToot {
  0% {
    transform: translateX(0px);
  }
  50% {
    transform: translateX(20px);
  }
  100% {
    transform: translateX(0px);
  }
}
</style>
