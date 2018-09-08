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
      Instance.find_by(url: url).users.find_or_create_by(user_id: account['id']) do |u|
        u.username = account.username
        u.display = account.display_name
      end
      User.find_by(user_id: account['id'])
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
