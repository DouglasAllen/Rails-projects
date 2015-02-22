class RegionsController < ApplicationController
  before_filter :authenticate_user! unless Rails.env == "test"
  before_filter :implementors_only! unless Rails.env == "test"

  # GET /regions/1/edit_data
  # GET /regions/1/edit_data.json
  def edit_data
    # TODO: region-type abstraction.  Build one, then extract it.
    @region = Region.find(params[:id])
    @data = MultiJson.load(@region.json_data || "{}")
    @data["terrain"] ||= []
  end

  # PUT /regions/1/edit_data
  # PUT /regions/1/edit_data.json
  def update_data
    region = Region.find(params[:id])
    data = MultiJson.load(@region.json_data || "{}")

    # TODO: merge incoming data

    region.json_data = MultiJson.dump(data, :pretty => true)

    redirect_to :action => :show, :id => id
  end

  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show
    @region = Region.find(params[:id])
    @data = MultiJson.load(@region.json_data || "{}")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @region }
    end
  end

  # GET /regions/new
  # GET /regions/new.json
  def new
    @region = Region.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @region }
    end
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(region_param)

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render json: @region, status: :created, location: @region }
      else
        format.html { render action: "new" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /regions/1
  # PUT /regions/1.json
  def update
    @region = Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(region_param)
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region = Region.find(params[:id])
    @region.destroy

    respond_to do |format|
      format.html { redirect_to regions_url }
      format.json { head :no_content }
    end
  end

  protected

  def region_param
    params[:region].permit(:description,:name,:json_data)
  end

end
