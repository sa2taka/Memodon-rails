<template>
  <div class="memos-bar">
    <a class="back_to_tags" @click="back_to_tags" v-if="isTagMemos">&lt;&lt;タグ一覧へ</a>
    <div v-else></div>
    <a class="btn btn-waves crawl-btn" @click="goToCrawl">新規メモを取得</a>
    <div class="switch bar-menu">
      <a id="menu" class="waves-effect waves-light btn btn-floating cyan darken-1 bar-menu__btn" @click="openMenu">
        <i class="material-icons">menu</i>
      </a>
      <div class="tap-target cyan darken-1 rotation" data-target="menu">
        <div class="tap-target-content">
          <label class="column-switch  white-text">
            単独カラム
            <input type="checkbox" checked @click="$emit('toggleColumn')">
            <span class="lever"></span>
            複数カラム
          </label>
          <br />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'memos_bar',
  data () {
    return {
      instance: Object
    }
  },
  mounted () {
    const elems = document.querySelectorAll('.tap-target')
    const options = {}
    this.instance = M.TapTarget.init(elems, options)[0]
  },
  methods: {
    goToCrawl: function () {
      this.$store.commit('setBeforeCrawlingUrl', location.href)
      this.$router.push({ name: 'crawling' })
    },
    back_to_tags: function () {
      location.href = "/#/tags"
    },
    openMenu: function () {
      this.instance.open()
    }
  },
  computed: {
    isTagMemos: function () {
      return location.href.match(/tag/)
    }
  },
  watch: {
  },
}
</script>

<style scoped>
.memos-bar {
  width: 90%;
  margin: 12px auto;
  display: -webkit-box;
  display: -ms-flexbox;
  display: -webkit-flex;
  display: flex;
  -webkit-box-pack: space-between;
  -ms-flex-pack: space-between;
  -webkit-justify-content: space-between;
  justify-content: space-between;
}
.tap-target {
  overflow: hidden;
}

.column-switch {
  font-size: 22px;
  font-weight: 400;
  color: rgb(51, 51, 51);
}

.back_to_tags {
  cursor: pointer;
  font-size: 16px;
}

.crawl-btn {
  right: 0;
}

.bar-menu {
  width: 90%;
  position: fixed;
  z-index: 9999;
  bottom: 96px;
}

.bar-menu__btn {
  position: absolute;
  right: 48px;
}

.tap-target-content > a {
  color: #039be5!important;
  font-size: 22px;
}

.rotation {
  transform: rotate(90deg) scale(0.1);
}

.open .rotation {
  transform: rotate(12deg) scale(1.0)!important;
}
</style>
