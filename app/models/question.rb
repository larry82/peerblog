class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers

  def next
    number = self.number+1
    return Question.where(quiz_id:self.quiz_id,number:number).first || false
  end

  def prev
  	number = self.number-1
    return Question.where(quiz_id:self.quiz_id,number:number).first || false
  end

end
