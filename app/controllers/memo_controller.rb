class MemoController < ApplicationController
  protect_from_forgery :except => [:crawl]

  def crawl
    CrawlerWorker.perform_async(session[:instance_url], session[:user_id])
  end
end
