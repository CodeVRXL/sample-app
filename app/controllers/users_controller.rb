class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to yaboiBigD" #Rails way of displaying a temporary msg. Here we are providing a key-value pair to be displayed upon success
      redirect_to @user #same as: redirect_to user_url(@user). Rails can automatically infer this
    else
      render 'new'
    end
  end

  def index
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
