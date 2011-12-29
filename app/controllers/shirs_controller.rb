class ShirsController < ApplicationController
  # GET /shirs
  # GET /shirs.json
  
  before_filter :get_categories
  
  def get_categories
  @categories = Category.all
  end
  
  def index
    @shirs = Shir.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @shirs }
    end
  end

  # GET /shirs/1
  # GET /shirs/1.json
  def show
    @shir = Shir.find(params[:id])
    @user = @shir.user
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
