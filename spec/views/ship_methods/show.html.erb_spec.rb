require 'spec_helper'

describe "/ship_methods/show.html.erb" do
  include ShipMethodsHelper
  before(:each) do
    assigns[:ship_methods] = @ship_methods = stub_model(ShipMethods,
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ description/)
  end
end
