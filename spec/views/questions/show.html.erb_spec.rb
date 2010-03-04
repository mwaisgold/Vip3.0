require 'spec_helper'

describe "/questions/show.html.erb" do
  include QuestionsHelper
  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :item => ,
      :question => "value for question",
      :answer => "value for answer"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(//)
    response.should have_text(/value\ for\ question/)
    response.should have_text(/value\ for\ answer/)
  end
end
