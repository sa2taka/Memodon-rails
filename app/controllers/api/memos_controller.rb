class Api::MemosController < ApiController
  def index
    render json: create_memos, each_serializer: MemosSerializer
  end

  def delete
    memo = delete_memo
    render json: memo, serializer: MemosSerializer
  end

  def is_crawling
    render json: create_is_crawling
  end

  private

  def create_memos
    page     = params[:page] || 1
    size     = params[:size] || Constants::DEFAULT_PAGE_SIZE
    user_id  = session[:user_id]
    tag_name = params[:tag_name]
    return find_user_memos_with_tag(user_id, page, size, tag_name) unless tag_name.nil?
    find_user_memos(user_id, page, size)
  end

  def create_is_crawling
    user_id = session[:user_id]
    answer = User
            .find(user_id)
            .instance
            .is_crawling
    { answer: answer }
  end

  def find_user_memos(user_id, page, size)
    User
      .find(user_id)
      .memos
      .page(page)
      .per(size)
      .order('memos.status_id desc')
  end

  def find_user_memos_with_tag(user_id, page, size, tag_name)
    User
      .find(user_id)
      .memos
      .page(page)
      .per(size)
      .joins(:tags)
      .where(['tags.name = ?', tag_name])
      .order('memos.status_id desc')
  end

  def delete_memo
    deleted_memo = Memo.find(params[:memo_id])
    deleted_memo.destroy
    deleted_memo
  end
end
