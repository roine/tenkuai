class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  before_filter :authenticate_user!, :except => [:show]


  # GET /users/1
  # GET /users/1.json
  def show
    
    @user = User.find(params[:id])
    @shirs = @user.shirs ? @user.shirs.order('created_at DESC') : {}
    @user_created_at = Time.at(@user.created_at.to_i)
    @introduction = @user.introduction ? @user.introduction : ''
    @website = @user.website ? @user.website : ''
    @photo = @user.photo_file_name ? @user.photo.url(:small) : 'test/santa.jpg'
    @username = @user.username
    @bought = Order.where(:user_id => @user.id)
    @sold = Order.where(:shir_id => @shirs)
    @title = @username
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @user }
      end
    end

    # GET /users/new
    # GET /users/new.json
    # def new
    #          @user = User.new
    #       
    #           respond_to do |format|
    #             format.html # new.html.erb
    #             format.json { render :json => @user }
    #           end
    #         end

    # GET /users/1/edit
    # def edit
    #                  redirect_to "/users/edit"
    #                  @user = User.find(params[:id])
    #                end

    # POST /users
    # POST /users.json
    # def create
    #                 
    #                         @user = User.new(params[:user])
    #                     
    #                         respond_to do |format|
    #                           if @user.save
    #                             format.html { redirect_to @user, :notice => 'User was successfully created.' }
    #                             format.json { render :json => @user, :status => :created, :location => @user }
    #                           else
    #                             format.html { render :action => "new" }
    #                             format.json { render :json => @user.errors, :status => :unprocessable_entity }
    #                           end
    #                         end
    #                       end
    #             
    # PUT /users/1
    # PUT /users/1.json
    # def update
    #       @user = User.find(params[:id])
    #   
    #       respond_to do |format|
    #         if @user.update_attributes(params[:user])
    #           format.html { redirect_to @user, :notice => 'User was successfully updated.' }
    #           format.json { head :ok }
    #         else
    #           format.html { render :action => "edit" }
    #           format.json { render :json => @user.errors, :status => :unprocessable_entity }
    #         end
    #       end
    #     end

    # DELETE /users/1
    # DELETE /users/1.json
    # def destroy
    #        @user = User.find(params[:id])
    #        @user.destroy
    #    
    #        respond_to do |format|
    #          format.html { redirect_to users_url }
    #          format.json { head :ok }
    #        end
    #      end
  end
