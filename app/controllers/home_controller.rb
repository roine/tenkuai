class HomeController < ApplicationController
  def index
    @last = User.last
    @created_at = @last.created_at+8.hours
  end

end
