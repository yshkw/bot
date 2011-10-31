class AddTokenToTwitterAuth < ActiveRecord::Migration
  def change
    add_column :twitter_auths, :uid, :integer
    add_column :twitter_auths, :screen_name, :string
    add_column :twitter_auths, :access_token, :string
    add_column :twitter_auths, :access_secret, :string
  end
end
