require 'spec_helper'

describe "/payment_methods/show.html.erb" do
  include PaymentMethodsHelper
  before(:each) do
    assigns[:payment_method] = @payment_method = stub_model(PaymentMethod,
      :name => "value for name",
      :logo => "value for logo"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ logo/)
  end
end
