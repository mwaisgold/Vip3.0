require 'spec_helper'

describe "/catalog_products/index.html.erb" do
  include CatalogProductsHelper

  before(:each) do
    assigns[:catalog_products] = [
      stub_model(CatalogProduct,
        :name => "value for name"
      ),
      stub_model(CatalogProduct,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of catalog_products" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
