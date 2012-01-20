class HomeController < ApplicationController
  def index
    @last = User.last
    unless @last.nil?
    @users = User.all
    @shirs_all = Shir.all
    @created_at = @last.created_at.+8.hours
    @categories = Category.all
    @shirs = Shir.order('created_at desc').limit(6)
    @featured_shir = Shir.featured.order('created_at DESC')
    @recent_shir = Shir.recent
    end
  end
end