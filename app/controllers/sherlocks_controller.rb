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
		@apartments = Apartment.find_with_features(@sherlock.features)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sherlock }
    end
  end

  # GET /sherlocks/new
  # GET /sherlocks/new.xml
  def new
    @sherlock = Sherlock.new
		@feature_terms = FeatureTerm.all.map{|a| a.feature}

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
		active_features = []
		params[:features].each { |k,v| if v=="1" then active_features << k end }
		@sherlock.features = active_features

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
