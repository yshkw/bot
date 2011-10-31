class TwitterAuth < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable

  def self.find_for_twitter_auth_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = TwitterAuth.find_by_uid(access_token['uid'].to_i)
      user
    else # Create a user with a stub password. 
      TwitterAuth.create!({
                            :uid => access_token['uid'].to_i,
                            :screen_name => data['screen_name'],
                            :access_token => access_token['credentials']['token'],
                            :access_secret => access_token['credentials']['secret']})
    end
  end 
end
