require "kippt/users"
require "kippt/followers"
require "kippt/following"
require "kippt/follow_relationship"

class Kippt::User
  include Kippt::Resource

  attributes :username, :bio, :app_url, :avatar_url, :twitter,
             :id, :github, :website_url, :full_name, :dribble,
             :counts, :resource_uri

  boolean_attributes :is_pro

  def collection_resource_class
    Kippt::Users
  end

  def followers
    Kippt::Followers.new(client, self)
  end

  def following
    Kippt::Following.new(client, self)
  end

  # Tells if authenticated user is following the user.
  def following?
    Kippt::FollowRelationship.new(client, self).following?
  end
end
