require 'spec_helper'

describe "/reviews/new.html.erb" do
  include ReviewsHelper

  before(:each) do
    assigns[:review] = stub_model(Review,
      :new_record? => true,
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

  it "renders new review form" do
    render

    response.should have_tag("form[action=?][method=post]", reviews_path) do
      with_tag("input#review_title[name=?]", "review[title]")
      with_tag("input#review_points[name=?]", "review[points]")
      with_tag("input#review_customer[name=?]", "review[customer]")
      with_tag("input#review_catalog_product[name=?]", "review[catalog_product]")
      with_tag("textarea#review_pros[name=?]", "review[pros]")
      with_tag("textarea#review_contras[name=?]", "review[contras]")
      with_tag("textarea#review_conclusion[name=?]", "review[conclusion]")
      with_tag("input#review_qty_votes[name=?]", "review[qty_votes]")
      with_tag("input#review_qty_pos[name=?]", "review[qty_pos]")
    end
  end
end
