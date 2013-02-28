module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    #self.current_user = user
    @current_user = user
  end

  # if current_user is not nil, we're signed in
  def signed_in?
    !current_user.nil?
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end


  # this is some funky method name! actually, it's »current_user=«
  # and is s.th like a method that imitates a variable assignment.
  # we use it in sign_in(user)
#   def current_user=(user)
#     @current_user = user
#   end
  
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
end
