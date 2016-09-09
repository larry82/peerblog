class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create_or_update_via_ajax
  	unless Answer.exists?(question_id:params[:question_id], quiz_result_id:params[:quiz_result_id])
  		@answer = Answer.create!(content:params[:score],question_id:params[:question_id], quiz_result_id:params[:quiz_result_id])
  	else
  		@answer = Answer.where(question_id:params[:question_id], quiz_result_id:params[:quiz_result_id]).first
  		unless @answer.content == params[:score]
  			@answer.update_attributes!(question_id:params[:question_id], quiz_result_id:params[:quiz_result_id],content:params[:score])
  		end
  	end
  	
  	# 已經完成的問題id 
  	questions_answered_ids_array = Answer.where(quiz_result_id:params[:quiz_result_id]).pluck(:question_id)
  	question_ids_array 			 = Quiz.find(@answer.question.quiz_id).questions.pluck(:id)
	
	next_id    = (question_ids_array - questions_answered_ids_array)[0]
	next_id  ||= question_ids_array.last

	next_number = Question.find(next_id).number
	@next_question_id = "questions_number_"+next_number.to_s

	@done = (questions_answered_ids_array.length == question_ids_array.length)

  end

  def create
    @answer 		 = Answer.new(answer_params)
    @answer.save!

  end

  def update
	@next_question   = @answer.question.next
	
  	if @answer.update(answer_params)
    	if @next_question
        	redirect_to quiz_page_question_path(@next_question, quiz_result_id:@answer.quiz_result_id)
        else
        	redirect_to report_quiz_result_path(@answer.quiz_result)
        end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_answer
      @answer = Answer.find(params[:id])
    end


    def answer_params
      params.require(:answer).permit(:question_id, :quiz_result_id, :content)
    end
end
