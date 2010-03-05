class CatalogProductsController < ApplicationController
  # GET /catalog_products
  # GET /catalog_products.xml
  def index
    @catalog_products = CatalogProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @catalog_products }
    end
  end

  # GET /catalog_products/1
  # GET /catalog_products/1.xml
  def show
    @catalog_product = CatalogProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @catalog_product }
    end
  end

  # GET /catalog_products/new
  # GET /catalog_products/new.xml
  def new
    @catalog_product = CatalogProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @catalog_product }
    end
  end

  # GET /catalog_products/1/edit
  def edit
    @catalog_product = CatalogProduct.find(params[:id])
  end

  # POST /catalog_products
  # POST /catalog_products.xml
  def create
    @catalog_product = CatalogProduct.new(params[:catalog_product])

    respond_to do |format|
      if @catalog_product.save
        flash[:notice] = 'CatalogProduct was successfully created.'
        format.html { redirect_to(@catalog_product) }
        format.xml  { render :xml => @catalog_product, :status => :created, :location => @catalog_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @catalog_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /catalog_products/1
  # PUT /catalog_products/1.xml
  def update
    @catalog_product = CatalogProduct.find(params[:id])

    respond_to do |format|
      if @catalog_product.update_attributes(params[:catalog_product])
        flash[:notice] = 'CatalogProduct was successfully updated.'
        format.html { redirect_to(@catalog_product) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @catalog_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_products/1
  # DELETE /catalog_products/1.xml
  def destroy
    @catalog_product = CatalogProduct.find(params[:id])
    @catalog_product.destroy

    respond_to do |format|
      format.html { redirect_to(catalog_products_url) }
      format.xml  { head :ok }
    end
  end
end
