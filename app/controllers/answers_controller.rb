class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all
  end

  def multi_create
    @answer1 = Answer.new(
      question_id: params[:answers]["1"][:question_id],
      content:     params[:answers]["1"][:content]
    )
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def edit
  end

  def create
    @answer 		 = Answer.new(answer_params)
    @next_question   = @answer.question.next

    if @answer.save!
    	if @next_question
        	redirect_to quiz_page_question_path(@next_question, quiz_result_id:@answer.quiz_result_id)
        else
        	redirect_to report_quiz_result_path(@answer.quiz_result)
        end
    end
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
