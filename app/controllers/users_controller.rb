class UsersController < ApplicationController
  skip_before_action :authenticate

  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      message = "passwords don't match."
    elsif user.save
      message = "account created."
    else
      message = "account couldn't be created. try again."
    end
    flash[:notice] = message
    redirect_to action: :sign_in
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "user doesn't exist."
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "password's wrong."
    else
      cookies[:username] = {
        value: @user.username,
        expires: 100.years.from_now
        }
      session[:user] = @user
    end
    flash[:notice] = message
    redirect_to posts_path
  end

  def sign_out!
    reset_session
    redirect_to posts_path
  end

end
