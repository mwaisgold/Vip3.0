require 'spec_helper'

describe "/questions/edit.html.erb" do
  include QuestionsHelper

  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :new_record? => false,
      :item => ,
      :question => "value for question",
      :answer => "value for answer"
    )
  end

  it "renders the edit question form" do
    render

    response.should have_tag("form[action=#{question_path(@question)}][method=post]") do
      with_tag('input#question_item[name=?]', "question[item]")
      with_tag('textarea#question_question[name=?]', "question[question]")
      with_tag('textarea#question_answer[name=?]', "question[answer]")
    end
  end
end
