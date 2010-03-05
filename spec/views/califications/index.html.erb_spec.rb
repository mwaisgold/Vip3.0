require 'spec_helper'

describe "/califications/index.html.erb" do
  include CalificationsHelper

  before(:each) do
    assigns[:califications] = [
      stub_model(Calification,
        :customer => 1,
        :item => 1,
        :texto_calif => "value for texto_calif",
        :value_calif => 1
      ),
      stub_model(Calification,
        :customer => 1,
        :item => 1,
        :texto_calif => "value for texto_calif",
        :value_calif => 1
      )
    ]
  end

  it "renders a list of califications" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for texto_calif".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
