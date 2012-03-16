class SherlocksController < ApplicationController

  # /about
  def about
  end

  # GET /sherlocks/1
  # GET /sherlocks/1.xml
  def show
    @sherlock = Sherlock.find(params[:id])
		@apartments = Apartment.find_with_features(@sherlock.required, @sherlock.desired, @sherlock.nots, @sherlock.region_id, @sherlock.price_min, @sherlock.price_max)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sherlock }
    end
  end

  # GET /sherlocks/new
  # GET /sherlocks/new.xml
  def new
    @sherlock = Sherlock.new
		@features = FeatureTerm.all.map{|a| a.feature}.sort

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sherlock }
    end
  end

  # POST /sherlocks
  # POST /sherlocks.xml
  def create
    @sherlock = Sherlock.new(params[:sherlock])
		active_required = []
		active_desired = []
		active_nots = []
		params[:required].each { |k,v| if v=="1" then active_required << k end }
		params[:desired].each { |k,v| if v=="1" then active_desired << k end }
		params[:nots].each { |k,v| if v=="1" then active_nots << k end }
		@sherlock.required = active_required
		@sherlock.desired = active_desired
		@sherlock.nots = active_nots

    respond_to do |format|
      if @sherlock.save
        format.html { redirect_to(@sherlock) }
        format.xml  { render :xml => @sherlock, :status => :created, :location => @sherlock }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sherlock.errors, :status => :unprocessable_entity }
      end
    end
  end

end
