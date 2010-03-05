require 'spec_helper'

describe "/catalog_product_attributes/show.html.erb" do
  include CatalogProductAttributesHelper
  before(:each) do
    assigns[:catalog_product_attributes] = @catalog_product_attributes = stub_model(CatalogProductAttributes,
      :key => "value for key",
      :value => "value for value",
      :catalog_product => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ key/)
    response.should have_text(/value\ for\ value/)
    response.should have_text(/1/)
  end
end
