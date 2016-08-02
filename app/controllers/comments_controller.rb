require 'byebug'
class CommentsController < ApplicationController
  def index
    if params.has_key?(:comment_id)
      @commentable = Comment.where(comment_id: params[:comment_id])
      @comment_type = @commentable.comment_type
    else
      raise "Please enter a commentable id and commenter type"
    end

    render json: @commentable
  end

  def create
    @commentable = Comment.new(comment_params)

    if @commentable.save
      render json: @commentable
    else
      render json: @commentable.errors.full_messages
    end
  end

  def show
    @commentable = Comment.find_by(id: params[:id])
    render json: @commentable
  end

  def update
    @commentable = Comment.find_by(id: params[:id])
    if @commentable.update(comment_params)
      render json: @commentable
    else
      render json: @commentable.errors.full_messages
    end
  end

  def destroy
    @commentable = Comment.find_by(id: params[:id])
    if @commentable.destroy
      render json: @commentable
    else
      render json: @commentable.errors.full_messages
    end
  end

  private
  def comment_params
    params.require(:commentable).permit()
  end

end
