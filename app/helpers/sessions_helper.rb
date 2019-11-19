module SessionsHelper
  # login user method
  def log_in(user)
    session[:user_id] = user.id    
  end

  # возвращает текущего вошедшего пользователя (если есть)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # возвращает true, если пользователь вошел, иначе false
  # current_user.nil? - вернет true если объект @current_user пуст
  # !current_user.nil? - знак ! (логическое отрицание -НЕ) инвертирует
  # поведение метода nil? т.е. если объект @current_user пуст, то 
  # !current_user.nil? вернет false  
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end