require 'spec_helper'

describe "/ship_methods/index.html.erb" do
  include ShipMethodsHelper

  before(:each) do
    assigns[:ship_methods] = [
      stub_model(ShipMethods,
        :description => "value for description"
      ),
      stub_model(ShipMethods,
        :description => "value for description"
      )
    ]
  end

  it "renders a list of ship_methods" do
    render
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
