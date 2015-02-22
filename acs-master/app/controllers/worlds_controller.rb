class WorldsController < ApplicationController
  before_filter :authenticate_user! unless Rails.env == "test"
  before_filter :implementors_only! unless Rails.env == "test"

  # GET /worlds
  # GET /worlds.json
  def index
    @worlds = World.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @worlds }
    end
  end

  # GET /worlds/1
  # GET /worlds/1.json
  def show
    @world = World.find(params[:id])
    @start_region_name = @world.start_region_id ? Region.find(@world.start_region_id).name : "None"
    @start_room_name = @world.start_room_id ? Room.find(@world.start_room_id).name : "None"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @world }
    end
  end

  # GET /worlds/new
  # GET /worlds/new.json
  def new
    @world = World.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @world }
    end
  end

  # GET /worlds/1/edit
  def edit
    @world = World.find(params[:id])
  end

  # POST /worlds
  # POST /worlds.json
  def create
    @world = World.new(params[:world].permit(:author_email, :author_name, :description, :name))

    respond_to do |format|
      if @world.save
        format.html { redirect_to @world, notice: 'World was successfully created.' }
        format.json { render json: @world, status: :created, location: @world }
      else
        format.html { render action: "new" }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /worlds/1
  # PUT /worlds/1.json
  def update
    @world = World.find(params[:id])

    respond_to do |format|
      if @world.update_attributes(params[:world].permit(:author_email, :author_name, :description, :name))
        format.html { redirect_to @world, notice: 'World was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @world.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worlds/1
  # DELETE /worlds/1.json
  def destroy
    @world = World.find(params[:id])
    @world.destroy

    respond_to do |format|
      format.html { redirect_to worlds_url }
      format.json { head :no_content }
    end
  end
end
