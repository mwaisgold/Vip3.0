require 'spec_helper'

describe "/catalog_products/show.html.erb" do
  include CatalogProductsHelper
  before(:each) do
    assigns[:catalog_product] = @catalog_product = stub_model(CatalogProduct,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
