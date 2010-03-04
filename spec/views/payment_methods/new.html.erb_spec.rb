require 'spec_helper'

describe "/payment_methods/new.html.erb" do
  include PaymentMethodsHelper

  before(:each) do
    assigns[:payment_method] = stub_model(PaymentMethod,
      :new_record? => true,
      :name => "value for name",
      :logo => "value for logo"
    )
  end

  it "renders new payment_method form" do
    render

    response.should have_tag("form[action=?][method=post]", payment_methods_path) do
      with_tag("input#payment_method_name[name=?]", "payment_method[name]")
      with_tag("input#payment_method_logo[name=?]", "payment_method[logo]")
    end
  end
end
