class QuestionsController < ApplicationController
  before_action :set_question, only: [:quiz_page,:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show

  	
  end

  def quiz_page
  	if params[:start_the_test] == "true"
    	@quiz_result = QuizResult.create(quiz_id:@question.quiz_id)
    else
    	@quiz_result = QuizResult.find(params[:quiz_result_id])
    end

    @options = []

    @question.options.split(" ").each_with_index do |i,index|
    	@options << [i,index]
    end

    @prev_question   = @question.prev
    @next_question	 = @question.next
    @questions_count = Quiz.find(@question.quiz_id).questions.count
	@answer 	     = Answer.where(question_id:@question.id,quiz_result_id:@quiz_result.id).first || @question.answers.new
  	
	@persentage 	 = (((@question.number.to_f-1)/@questions_count).round(2)*100).to_s+"%"


  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)

    if @question.save
        redirect_to questions_path
    else
        redirect_to :back
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end


    def question_params
      params.require(:question).permit(:quiz_id, :number, :content,:options, :introduction, :category)
    end
end
