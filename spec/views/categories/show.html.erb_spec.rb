require 'spec_helper'

describe "/categories/show.html.erb" do
  include CategoriesHelper
  before(:each) do
    assigns[:category] = @category = stub_model(Category,
      :name => "value for name",
      :Category => ,
      :accept_items => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(//)
    response.should have_text(/false/)
  end
end
