require 'spec_helper'

describe "/ship_methods/edit.html.erb" do
  include ShipMethodsHelper

  before(:each) do
    assigns[:ship_methods] = @ship_methods = stub_model(ShipMethods,
      :new_record? => false,
      :description => "value for description"
    )
  end

  it "renders the edit ship_methods form" do
    render

    response.should have_tag("form[action=#{ship_methods_path(@ship_methods)}][method=post]") do
      with_tag('input#ship_methods_description[name=?]', "ship_methods[description]")
    end
  end
end
