require 'spec_helper'

describe "/reviews/index.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:reviews] = [
      stub_model(Review,
        :title => "value for title",
        :points => 1,
        :customer => 1,
        :catalog_product => 1,
        :pros => "value for pros",
        :contras => "value for contras",
        :conclusion => "value for conclusion",
        :qty_votes => 1,
        :qty_pos => 1
      ),
      stub_model(Review,
        :title => "value for title",
        :points => 1,
        :customer => 1,
        :catalog_product => 1,
        :pros => "value for pros",
        :contras => "value for contras",
        :conclusion => "value for conclusion",
        :qty_votes => 1,
        :qty_pos => 1
      )
    ]
  end

  it "renders a list of reviews" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for pros".to_s, 2)
    response.should have_tag("tr>td", "value for contras".to_s, 2)
    response.should have_tag("tr>td", "value for conclusion".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
