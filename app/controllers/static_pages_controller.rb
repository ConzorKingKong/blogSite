class StaticPagesController < ApplicationController
  # require 'will_paginate/array'

  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @feed_items = User.first.microposts.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  # def all_microposts
  #   User.all.each {|u| puts u.microposts}
  # end

end
