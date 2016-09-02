class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :quiz_result

  validates_presence_of :content
end
