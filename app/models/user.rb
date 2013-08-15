class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :provider, :uid

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.last_name = auth["info"]["last_name"]
      user.first_name = auth["info"]["first_name"]
    end
  end
end
