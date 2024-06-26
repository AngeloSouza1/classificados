class UsersController < ActionController::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    NotificationMailer.welcome(@user.name, @user.email).deliver_later
    redirect_to new_session_path, notice: t(".success")
    else
      render:new
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end




end
