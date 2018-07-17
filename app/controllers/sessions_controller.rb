class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
        log_in user
        redirect_to user #Rails automatically converts this to the route for the user's profile page: user_url(user)
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new' #renders the 'new' view in app/views/sessions
    end
  end

  def destroy
  end

end
