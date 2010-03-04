require 'spec_helper'

describe "/payment_methods/edit.html.erb" do
  include PaymentMethodsHelper

  before(:each) do
    assigns[:payment_method] = @payment_method = stub_model(PaymentMethod,
      :new_record? => false,
      :name => "value for name",
      :logo => "value for logo"
    )
  end

  it "renders the edit payment_method form" do
    render

    response.should have_tag("form[action=#{payment_method_path(@payment_method)}][method=post]") do
      with_tag('input#payment_method_name[name=?]', "payment_method[name]")
      with_tag('input#payment_method_logo[name=?]', "payment_method[logo]")
    end
  end
end
