require 'spec_helper'

describe "/questions/index.html.erb" do
  include QuestionsHelper

  before(:each) do
    assigns[:questions] = [
      stub_model(Question,
        :item => ,
        :question => "value for question",
        :answer => "value for answer"
      ),
      stub_model(Question,
        :item => ,
        :question => "value for question",
        :answer => "value for answer"
      )
    ]
  end

  it "renders a list of questions" do
    render
    response.should have_tag("tr>td", .to_s, 2)
    response.should have_tag("tr>td", "value for question".to_s, 2)
    response.should have_tag("tr>td", "value for answer".to_s, 2)
  end
end
