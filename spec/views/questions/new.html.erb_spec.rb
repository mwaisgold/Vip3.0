require 'spec_helper'

describe "/questions/new.html.erb" do
  include QuestionsHelper

  before(:each) do
    assigns[:question] = stub_model(Question,
      :new_record? => true,
      :item => ,
      :question => "value for question",
      :answer => "value for answer"
    )
  end

  it "renders new question form" do
    render

    response.should have_tag("form[action=?][method=post]", questions_path) do
      with_tag("input#question_item[name=?]", "question[item]")
      with_tag("textarea#question_question[name=?]", "question[question]")
      with_tag("textarea#question_answer[name=?]", "question[answer]")
    end
  end
end
