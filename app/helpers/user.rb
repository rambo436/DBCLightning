# include MD5 gem, should be part of standard ruby install

helpers do

require 'digest/md5'

  def current_user
    if session[:id]
      User.find(session[:id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def gravatar_hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end

end
