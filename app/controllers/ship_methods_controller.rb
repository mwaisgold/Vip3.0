class ShipMethodsController < ApplicationController
  # GET /ship_methods
  # GET /ship_methods.xml
  def index
    @ship_methods = ShipMethods.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ship_methods }
    end
  end

  # GET /ship_methods/1
  # GET /ship_methods/1.xml
  def show
    @ship_methods = ShipMethods.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ship_methods }
    end
  end

  # GET /ship_methods/new
  # GET /ship_methods/new.xml
  def new
    @ship_methods = ShipMethods.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ship_methods }
    end
  end

  # GET /ship_methods/1/edit
  def edit
    @ship_methods = ShipMethods.find(params[:id])
  end

  # POST /ship_methods
  # POST /ship_methods.xml
  def create
    @ship_methods = ShipMethods.new(params[:ship_methods])

    respond_to do |format|
      if @ship_methods.save
        flash[:notice] = 'ShipMethods was successfully created.'
        format.html { redirect_to(@ship_methods) }
        format.xml  { render :xml => @ship_methods, :status => :created, :location => @ship_methods }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ship_methods.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ship_methods/1
  # PUT /ship_methods/1.xml
  def update
    @ship_methods = ShipMethods.find(params[:id])

    respond_to do |format|
      if @ship_methods.update_attributes(params[:ship_methods])
        flash[:notice] = 'ShipMethods was successfully updated.'
        format.html { redirect_to(@ship_methods) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ship_methods.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ship_methods/1
  # DELETE /ship_methods/1.xml
  def destroy
    @ship_methods = ShipMethods.find(params[:id])
    @ship_methods.destroy

    respond_to do |format|
      format.html { redirect_to(ship_methods_url) }
      format.xml  { head :ok }
    end
  end
end
