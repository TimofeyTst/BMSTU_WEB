class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[new create] 

  def new; end

  def create
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      flash[:notice] = 'Successfully log in'
      sign_in user
      redirect_to root_path
    else
      flash[:error] = 'Invalid login or password'
      redirect_to session_new_path
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'Loggin out'
    redirect_to session_new_path
  end
end
