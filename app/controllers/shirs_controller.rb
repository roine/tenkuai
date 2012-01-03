class ShirsController < ApplicationController
  # GET /shirs
  # GET /shirs.json

  before_filter :get_categories

  def get_categories
    @categories = Category.all
  end

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

  def index
    @shirs = Shir.all
    if params[:tags]
      @shirs = Shir.tagged_with(params[:tags])
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @shirs }
    end
  end

  # GET /shirs/1
  # GET /shirs/1.json
  def show
   
    @shir = Shir.find(params[:id])
     if Shir.find(params[:id]).user.username.capitalize != params[:user_id].capitalize
      @t = 'true'
      end
    @user = @shir.user
    @since = since
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @shir }
    end
    
  end

  # GET /shirs/new
  # GET /shirs/new.json
  def new
    @shir = Shir.new
    authorize! :create, @shir
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @shir }
    end
  end

  # GET /shirs/1/edit
  def edit
    @categories = Category.all
    @shir = Shir.find(params[:id])
    authorize! :edit, @shir
  end

  # POST /shirs
  # POST /shirs.json
  def create
    @shir = Shir.new(params[:shir])

    respond_to do |format|
      if @shir.save
        format.html { redirect_to @shir, :notice => 'Shir was successfully created.' }
        format.json { render :json => @shir, :status => :created, :location => @shir }
      else
        format.html { render :action => "new" }
        format.json { render :json => @shir.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shirs/1
  # PUT /shirs/1.json
  def update
    @shir = Shir.find(params[:id])

    respond_to do |format|
      if @shir.update_attributes(params[:shir])
        format.html { redirect_to @shir, :notice => 'Shir was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @shir.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shirs/1
  # DELETE /shirs/1.json
  def destroy
    @shir = Shir.find(params[:id])
    @shir.destroy

    respond_to do |format|
      format.html { redirect_to shirs_url }
      format.json { head :ok }
    end
  end
end
