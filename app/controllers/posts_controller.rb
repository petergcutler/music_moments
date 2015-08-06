class PostsController < ApplicationController
  # index
  def index
    @posts = Post.all.reverse_order
  end

  def mostcommented
    @posts = Post.order("comments_count, created_at DESC").reverse_order
  end

  def mostliked
    @posts = Post.order("cached_votes_score DESC")
  end

  def upvote
    @post = Post.find(params[:id])
    @user = User.find(session[:user]["id"])
    @post.liked_by @user
    redirect_to @post
  end

  def downvote
    @post = Post.find(params[:id])
    @user = User.find(session[:user]["id"])
    @post.downvote_from @user
    redirect_to @post
  end

  def tagged
    if params[:tag].present?
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.postall
    end
  end
  # new
  def new
    @post = Post.new
  end

  # create
  def create
    @user = User.find(session[:user]["id"])
    @post = @user.posts.create!(post_params)
    redirect_to (post_path(@post))
  end

  #show
  def show
    @post = Post.find(params[:id])
  end

  # edit
  def edit
    @post = Post.find(params[:id])
  end


  # update
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  # destroy
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :datetime, :song_url, :moment, :tag_list, :user_id)
  end
end
