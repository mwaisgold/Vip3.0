class CatalogProductAttributesController < ApplicationController
  # GET /catalog_product_attributes
  # GET /catalog_product_attributes.xml
  def index
    @catalog_product_attributes = CatalogProductAttributes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catalog_product_attributes }
    end
  end

  # GET /catalog_product_attributes/1
  # GET /catalog_product_attributes/1.xml
  def show
    @catalog_product_attributes = CatalogProductAttributes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catalog_product_attributes }
    end
  end

  # GET /catalog_product_attributes/new
  # GET /catalog_product_attributes/new.xml
  def new
    @catalog_product_attributes = CatalogProductAttributes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catalog_product_attributes }
    end
  end

  # GET /catalog_product_attributes/1/edit
  def edit
    @catalog_product_attributes = CatalogProductAttributes.find(params[:id])
  end

  # POST /catalog_product_attributes
  # POST /catalog_product_attributes.xml
  def create
    @catalog_product_attributes = CatalogProductAttributes.new(params[:catalog_product_attributes])

    respond_to do |format|
      if @catalog_product_attributes.save
        flash[:notice] = 'CatalogProductAttributes was successfully created.'
        format.html { redirect_to(@catalog_product_attributes) }
        format.xml  { render :xml => @catalog_product_attributes, :status => :created, :location => @catalog_product_attributes }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catalog_product_attributes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catalog_product_attributes/1
  # PUT /catalog_product_attributes/1.xml
  def update
    @catalog_product_attributes = CatalogProductAttributes.find(params[:id])

    respond_to do |format|
      if @catalog_product_attributes.update_attributes(params[:catalog_product_attributes])
        flash[:notice] = 'CatalogProductAttributes was successfully updated.'
        format.html { redirect_to(@catalog_product_attributes) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catalog_product_attributes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_product_attributes/1
  # DELETE /catalog_product_attributes/1.xml
  def destroy
    @catalog_product_attributes = CatalogProductAttributes.find(params[:id])
    @catalog_product_attributes.destroy

    respond_to do |format|
      format.html { redirect_to(catalog_product_attributes_url) }
      format.xml  { head :ok }
    end
  end
end
