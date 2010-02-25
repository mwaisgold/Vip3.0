require 'spec_helper'

describe "/items/show.html.erb" do
  include ItemsHelper
  before(:each) do
    assigns[:item] = @item = stub_model(Item,
      :site_id => "MLA",
      :item_id => 123123,
      :title => "Titulo de testeo",
      :image => "drlfldm",
      :description => "Descripcion",
      :price => 9.99,
      :bids_count => 223,
      :cust_id => 94798703
    )

    assigns[:customer] = @customer = @item.get_customer 
  end

  it "Se fija si el title del html tiene el titulo del articulo" do
    render
    response.should have_tag('title',/Titulo de testeo/)
  end
end
