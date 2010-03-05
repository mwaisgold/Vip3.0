require 'spec_helper'

describe "/reviews/show.html.erb" do
  include ReviewsHelper
  before(:each) do
    assigns[:review] = @review = stub_model(Review,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ pros/)
    response.should have_text(/value\ for\ contras/)
    response.should have_text(/value\ for\ conclusion/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
