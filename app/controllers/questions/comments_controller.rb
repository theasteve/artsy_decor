class Questions::CommentsController < CommentsController
  before_action :set_commentable
  before_action :authenticate_user!

  private

  def set_commentable
    @commentable = Question.find(params['question_id'])
  end
end
