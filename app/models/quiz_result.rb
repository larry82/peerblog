class QuizResult < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers
end
