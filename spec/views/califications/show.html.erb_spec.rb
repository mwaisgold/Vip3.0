require 'spec_helper'

describe "/califications/show.html.erb" do
  include CalificationsHelper
  before(:each) do
    assigns[:calification] = @calification = stub_model(Calification,
      :customer => 1,
      :item => 1,
      :texto_calif => "value for texto_calif",
      :value_calif => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ texto_calif/)
    response.should have_text(/1/)
  end
end
