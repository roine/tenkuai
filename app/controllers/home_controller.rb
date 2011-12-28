class HomeController < ApplicationController
  def index
    @last = User.last
    unless @last.nil?
    
    @created_at = @last.created_at.+8.hours
    @categories = Category.all
    end
  end
end