require 'spec_helper'

describe "/catalog_product_attributes/edit.html.erb" do
  include CatalogProductAttributesHelper

  before(:each) do
    assigns[:catalog_product_attributes] = @catalog_product_attributes = stub_model(CatalogProductAttributes,
      :new_record? => false,
      :key => "value for key",
      :value => "value for value",
      :catalog_product => 1
    )
  end

  it "renders the edit catalog_product_attributes form" do
    render

    response.should have_tag("form[action=#{catalog_product_attributes_path(@catalog_product_attributes)}][method=post]") do
      with_tag('input#catalog_product_attributes_key[name=?]', "catalog_product_attributes[key]")
      with_tag('input#catalog_product_attributes_value[name=?]', "catalog_product_attributes[value]")
      with_tag('input#catalog_product_attributes_catalog_product[name=?]', "catalog_product_attributes[catalog_product]")
    end
  end
end
