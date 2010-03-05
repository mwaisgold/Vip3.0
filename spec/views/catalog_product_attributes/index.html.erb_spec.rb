require 'spec_helper'

describe "/catalog_product_attributes/index.html.erb" do
  include CatalogProductAttributesHelper

  before(:each) do
    assigns[:catalog_product_attributes] = [
      stub_model(CatalogProductAttributes,
        :key => "value for key",
        :value => "value for value",
        :catalog_product => 1
      ),
      stub_model(CatalogProductAttributes,
        :key => "value for key",
        :value => "value for value",
        :catalog_product => 1
      )
    ]
  end

  it "renders a list of catalog_product_attributes" do
    render
    response.should have_tag("tr>td", "value for key".to_s, 2)
    response.should have_tag("tr>td", "value for value".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
