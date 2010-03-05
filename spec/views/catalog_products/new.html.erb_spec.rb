require 'spec_helper'

describe "/catalog_products/new.html.erb" do
  include CatalogProductsHelper

  before(:each) do
    assigns[:catalog_product] = stub_model(CatalogProduct,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new catalog_product form" do
    render

    response.should have_tag("form[action=?][method=post]", catalog_products_path) do
      with_tag("input#catalog_product_name[name=?]", "catalog_product[name]")
    end
  end
end
