module ShirsHelper
  def since
    @shir = Shir.find(params[:id])
    @since_in_sec = (Time.now.to_i - @shir.created_at.to_i)
    @since_in_min = @since_in_sec / (60)
    @since_in_hour = @since_in_min / (60)
    @since_in_day = @since_in_hour / (24)
    @since_in_week = @since_in_day / (7)
    @since_in_month = @since_in_day / (31)
    @since_in_year = @since_in_day / (365)
    if @since_in_sec < 60
      @since = "#{@since_in_sec} second"
    elsif @since_in_min < 60
      @since = "#{@since_in_min} minute"
    elsif @since_in_hour < 24
      @since = "#{@since_in_hour} hour"
    elsif @since_in_day < 7
      @since = "#{@since_in_day} day"
    elsif @since_in_day < 30
      @since = "#{@since_in_week} week"
    elsif @since_in_day < 365
      @since = "#{@since_in_month} month"
    elsif @since_in_day >= 365
      @since = "#{@since_in_year} year"
    end
    if @since.to_i > 1
      @since = @since.pluralize
    end
    return @since
  end


 

end
