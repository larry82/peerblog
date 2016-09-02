class QuizResultsController < ApplicationController
  before_action :set_quiz_result, only: [:report,:show, :edit, :update, :destroy]

  def index
    @quiz_results = QuizResult.all
  end

  def report
  	@scores = @quiz_result.answers.sum(:content)

  	case @scores

  	when 0..5
  		@result_category = "70~75"
  		@result_content  = "太棒了，您真是灌籃高手"
  	when 6..14
  		@result_category = "76~84"
  		@result_content  = "太棒了，您真是灌籃高手"
  	when 15..20
  		@result_category = "85~90"
  		@result_content  = "太棒了，您真是灌籃高手"
  	when 21..30
  		@result_category = "91~99"
  		@result_content  = "太棒了，您真是灌籃高手"
  	end


  	
  	unless @quiz_result.scores == @scores
  		@quiz_result.update_attributes(scores: @scores)
  	end
  end	

  def show
  end

  def new
    @quiz_result = QuizResult.new
  end

  def edit
  end

  def create
    @quiz_result = QuizResult.new(quiz_result_params)

    respond_to do |format|
      if @quiz_result.save
        format.html { redirect_to @quiz_result, notice: 'Quiz result was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_result }
      else
        format.html { render :new }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @quiz_result.update(quiz_result_params)
        format.html { redirect_to @quiz_result, notice: 'Quiz result was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_result }
      else
        format.html { render :edit }
        format.json { render json: @quiz_result.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz_result.destroy
    respond_to do |format|
      format.html { redirect_to quiz_results_url, notice: 'Quiz result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
 
    def set_quiz_result
      @quiz_result = QuizResult.find(params[:id])
    end

 
    def quiz_result_params
      params.require(:quiz_result).permit(:quiz_id, :scores, :answers, :email)
    end
end
