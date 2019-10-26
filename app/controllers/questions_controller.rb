class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    binding.pry
    @question = current_user.questions.create(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
  end

  private

  def question_params
    params.require(:question).permit(
      :user_id,
      :title,
      :content
    )
  end
end
