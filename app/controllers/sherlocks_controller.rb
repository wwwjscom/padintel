class SherlocksController < ApplicationController
  # GET /sherlocks
  # GET /sherlocks.xml
  def index
    @sherlocks = Sherlock.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sherlocks }
    end
  end

  # GET /sherlocks/1
  # GET /sherlocks/1.xml
  def show
    @sherlock = Sherlock.find(params[:id])
		@apartments = Apartment.find_with_features(@sherlock.required, @sherlock.desired, @sherlock.nots)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sherlock }
    end
  end

  # GET /sherlocks/new
  # GET /sherlocks/new.xml
  def new
    @sherlock = Sherlock.new
		@features = FeatureTerm.all.map{|a| a.feature}

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sherlock }
    end
  end

  # GET /sherlocks/1/edit
  def edit
    @sherlock = Sherlock.find(params[:id])
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
        format.html { redirect_to(@sherlock, :notice => 'Sherlock was successfully created.') }
        format.xml  { render :xml => @sherlock, :status => :created, :location => @sherlock }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sherlock.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sherlocks/1
  # PUT /sherlocks/1.xml
  def update
    @sherlock = Sherlock.find(params[:id])

    respond_to do |format|
      if @sherlock.update_attributes(params[:sherlock])
        format.html { redirect_to(@sherlock, :notice => 'Sherlock was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sherlock.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sherlocks/1
  # DELETE /sherlocks/1.xml
  def destroy
    @sherlock = Sherlock.find(params[:id])
    @sherlock.destroy

    respond_to do |format|
      format.html { redirect_to(sherlocks_url) }
      format.xml  { head :ok }
    end
  end
end
