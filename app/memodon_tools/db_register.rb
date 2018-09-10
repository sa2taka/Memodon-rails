class DBRegister
  class << self
    def insert_database(timeline)
      timeline.each do |status|
        insert_account(status.account)
        insert_memo(status)
      end
    end

    def insert_account(account)
      url = account.url.match(/(https:\/\/.+?)\//)[1]
      Instance.find_by(url: url).users.find_or_create_by(account_id: account['id']) do |u|
        u.username = account.username
        u.display = account.display_name
      end
      User.find_by(account_id: account['id'])
    end

    def insert_memo(status)
      # この前にかならずユーザーを保存しているため存在しないことは考えなくて良い
      user = User.find_by(account_id: status.account['id'])
      content = status.content
      content = status.spoiler_text + '</br>' + content unless status.spoiler_text.empty?
      memo = user.memos.create do |m|
        m.status_id = status.id.to_i
        m.text = content
        m.url = status.url
      end

      status.media_attachments.each do |medium|
        memo.media.create do |m|
          m.url = medium['url']
          m.preview_url = medium['preview_url']
          m.media_type = medium['type']
        end
      end

      status.tags.each do |tag|
        next if tag['name'] == 'メモ'
        tag = Tag.find_or_create_by(name: tag['name'])
        memo.tags << tag
      end
      memo
    end
  end
end
