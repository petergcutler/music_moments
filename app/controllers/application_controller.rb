class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate
  before_action :tag_cloud

  private
  def authenticate
    if !session[:user]
      redirect_to "/sign_up"
    end
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end

end
