require 'spec_helper'

describe Question do
  before(:each) do
    @valid_attributes = {
      :item => ,
      :question => "value for question",
      :question_dt => Date.today,
      :answer => "value for answer",
      :answer_dt => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: questions
#
#  id          :integer(38)     not null, primary key
#  question    :text
#  question_dt :datetime
#  answer      :text
#  answer_dt   :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

