class CommentsController < ApplicationController
  # index
  def index
    @comments = Comment.all
  end

  # new
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  # create
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create!(comment_params.merge(post: @post))
    redirect_to post_path(@post)
  end

  #show
  def show
    @comment = Comment.find(params[:id])
  end

  # edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # update
  def update
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.update(comment_params.merge(post: @post))
    redirect_to post_path(@post)
  end

  # destroy
  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :datetime, :content, :post_id)
  end
end
