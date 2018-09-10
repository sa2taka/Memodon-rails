# メモをデータベースにinsertするクラス
# crawlメソッドで自動的に(未登録の)メモ(と未登録のアカウント)をinsertする
class MemoCrawler
  class << self
    def crawl(instance_url, user_id, max_id = nil, latest_id = nil)
      latest_id ||= Memos.order('status_id desc').first&.status_id || 1
      client = MstdnIvory::Client.new(instance_url)
      timeline = client.get('/api/v1/timelines/tag/メモ', { local: 'true', since_id: latest_id, max_id: max_id, limit: 40 })
      DBRegister.insert_database(timeline)

      # 過去のtootをクロールするための処理
      if timeline.length >= 40
        max_id = timeline[-1].id
        sleep(1.5)
        crawl(instance_url, user_id, max_id, latest_id)
      end
    end
  end
end
