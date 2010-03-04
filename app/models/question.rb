class Question < ActiveRecord::Base
  belongs_to :item
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

