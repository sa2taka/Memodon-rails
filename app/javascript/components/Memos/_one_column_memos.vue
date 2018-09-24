<template>
  <div class="one-column-base">
    <memo :memo="memo" v-for="memo in memos" :isOneColumn="true" :key="memo.id" @delete_memo="$emit('memo_delete')"></memo>
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
    }
  },
  mounted () {
  },
  updated () {
  },
  methods: {
  },
  components: {
    Memo
  }
}
</script>

<style scoped>
.one-column-base {
  position: relative;
  width: 100%;
  display: flex;
  flex-flow: column;
  height: auto;
}
</style>
