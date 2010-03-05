require 'spec_helper'

describe "/catalog_products/edit.html.erb" do
  include CatalogProductsHelper

  before(:each) do
    assigns[:catalog_product] = @catalog_product = stub_model(CatalogProduct,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit catalog_product form" do
    render

    response.should have_tag("form[action=#{catalog_product_path(@catalog_product)}][method=post]") do
      with_tag('input#catalog_product_name[name=?]', "catalog_product[name]")
    end
  end
end
