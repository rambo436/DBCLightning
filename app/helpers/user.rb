# include MD5 gem, should be part of standard ruby install
 
helpers do

require 'digest/md5'

  def current_user
    session["user"]
  end

  def gravatar_hash(email)
    Digest::MD5.hexdigest(email.downcase.strip)
  end

end