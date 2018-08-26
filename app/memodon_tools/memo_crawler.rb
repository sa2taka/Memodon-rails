module MemodonTools
  # メモをデータベースにinsertするクラス
  # behaviorメソッドで自動的に(未登録の)メモ(と未登録のアカウント)をinsertする
  class MemoCrawler
    class << self
      def crawl(instance_url, username, access_token, max_id = nil)
        latest_id = User.find(username: username).memos.order('status_id desc').first&.status_id || 1
        client = MstdnIvory::Client.new("https://#{instance_url}", access_token)
        timeline = client.get('/api/v1/timelines/tag/メモ', { local: 'true', since_id: latest_id, max_id: max_id, limit: 40 })
        insert_database(timeline)

        # 過去のtootをクロールするための処理
        if timeline.length >= 40
          max_id = timeline[-1].id
          sleep(1.5)
          crawl(instance_url, username, access_token, max_id)
        end
      end

      def insert_database(timeline)
        timeline.each do |status|
          insert_account(status.account)
          insert_memo(status)
        end
      end

      def insert_account(account)
        url = account.url.match(/https:\/\/(.+?)\//)[1]
        Instance.find_by(url: url).user.find_or_create_by(id: account['id']) do |u|
          u.username = account.username
          u.display = account.display_name
        end
      end

      def insert_memo(status)
        # この前にかならずユーザーを保存しているため存在しないことは考えなくて良い
        user = User.find(status.account['id'])
        content = status.content
        content = status.spoiler_text + '</br>' + content unless status.spoiler_text.empty?
        memo = user.memo.create do |m|
          m.id = status.id.to_i
          m.memo_status = content
        end

        status.media_attachments.each do |medium|
          memo.medium.create do |m|
            m.url = medium['url']
            m.preview_url = medium['preview_url']
            m.type = medium['type']
          end
        end
      end
    end
  end
end
