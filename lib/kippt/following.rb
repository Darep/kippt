require "kippt/collection_resource"
require "kippt/user_collection"
require "kippt/user"

class Kippt::Following
  include Kippt::CollectionResource

  attr_reader :user

  def initialize(client, user)
    @client = client
    @user   = user
  end

  def object_class
    Kippt::User
  end

  def collection_class
    Kippt::UserCollection
  end

  def base_uri
    "users/#{user.id}/following"
  end
end
