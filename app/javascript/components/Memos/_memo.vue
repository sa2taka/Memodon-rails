<template>
  <div id="memo" class="col s10 offset-s1">
    <div class="card orange lighten-3">
      <div class="card-content black-text">
        <div class="status-content" v-html="memo.text">

        </div>
        <div class="row actions">
          <div class="col s6 center go-to-toot">
            <a :href="https://mstdn-workers.com/web/statuses/${memo.id}" class="card-link">
              <i class="material-icons memo-link-icon">subdirectory_arrow_right</i>
            </a>
          </div>
          <div class="col s6 center delete-memo">
            <a class="card-link" :click="deleteMemo(memo.id)">
              <i class="material-icons memo-link-icon">delete_forever</i>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
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
  }
}
</script>

<style scoped>
</style>
