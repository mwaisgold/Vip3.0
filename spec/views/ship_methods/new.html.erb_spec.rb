require 'spec_helper'

describe "/ship_methods/new.html.erb" do
  include ShipMethodsHelper

  before(:each) do
    assigns[:ship_methods] = stub_model(ShipMethods,
      :new_record? => true,
      :description => "value for description"
    )
  end

  it "renders new ship_methods form" do
    render

    response.should have_tag("form[action=?][method=post]", ship_methods_path) do
      with_tag("input#ship_methods_description[name=?]", "ship_methods[description]")
    end
  end
end
