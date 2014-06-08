class CommentsController < ApplicationController
  
  def index
    # @commentable =  Question.find(params[:question_id])

    # # p @commentable
    # # p "******"
    # respond_to do |format|
    #   format.js { render :show_comment, :locals => {:commentable => @commentable}}
    # end
  end


  def show_comment
     @commentable =  Question.find(params[:question_id])

    # p @commentable
    # p "******"
    respond_to do |format|
      format.js { render :show_comment, :locals => {:commentable => @commentable}}
    end
  end
  

  def new
    @comment = Comment.new 
  end


  def create

    question = Question.find(params[:question_id])
    question.comments.create(comment_params)
    # comment = Comment.create(comment_params)

    p comment_params
    p "you got here!!!!"
    # p comment
    p "*"
    redirect_to question_path(question)

  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
