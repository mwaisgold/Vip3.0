class CalificationsController < ApplicationController
  # GET /califications
  # GET /califications.xml
  def index
    @califications = Calification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @califications }
    end
  end

  # GET /califications/1
  # GET /califications/1.xml
  def show
    @calification = Calification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calification }
    end
  end

  # GET /califications/new
  # GET /califications/new.xml
  def new
    @calification = Calification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calification }
    end
  end

  # GET /califications/1/edit
  def edit
    @calification = Calification.find(params[:id])
  end

  # POST /califications
  # POST /califications.xml
  def create
    @calification = Calification.new(params[:calification])

    respond_to do |format|
      if @calification.save
        flash[:notice] = 'Calification was successfully created.'
        format.html { redirect_to(@calification) }
        format.xml  { render :xml => @calification, :status => :created, :location => @calification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /califications/1
  # PUT /califications/1.xml
  def update
    @calification = Calification.find(params[:id])

    respond_to do |format|
      if @calification.update_attributes(params[:calification])
        flash[:notice] = 'Calification was successfully updated.'
        format.html { redirect_to(@calification) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /califications/1
  # DELETE /califications/1.xml
  def destroy
    @calification = Calification.find(params[:id])
    @calification.destroy

    respond_to do |format|
      format.html { redirect_to(califications_url) }
      format.xml  { head :ok }
    end
  end
end
