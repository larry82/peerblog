class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy,:quiz_page]

  def index
    @quizzes = Quiz.all
  end

  def show
    @questions = @quiz.questions.order(:number)
  end

  def new
    @quiz = Quiz.new
  end

  def quiz_page
    @quiz_result = QuizResult.create(quiz_id: @quiz.id)
  	@questions   = @quiz.questions.order(:number)
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
    	redirect_to new_question_path
    end
  end

  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_quiz
      @quiz = Quiz.find(params[:id])
    end


    def quiz_params
      params.require(:quiz).permit(:title,:subtitle, :introduction)
    end
end
