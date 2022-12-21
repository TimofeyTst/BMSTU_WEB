module ApplicationHelper
  def sign_in(user)
    cookies.signed[:user_id] = { value: user.id, expires: 10.days }
    user.touch(:last_login)
    @current_user = user
  end

  def sign_in?
    !current_user.nil?
  end

  def sign_out
    cookies.signed[:user_id] = nil
    @current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end
end
