require "kippt/resource"
require "kippt/user"
require "kippt/clip"

class Kippt::Comment
  include Kippt::Resource

  attributes :body, :id, :resource_uri,
             :created => Time, :user => Kippt::User

  writable_attributes :body

  attr_reader :clip

  def initialize(attributes = {}, client = nil, clip = nil)
    super(attributes, client)
    @clip = clip
  end

  private

  def collection_resource
    @collection_resource ||= client.collection_resource_for(Kippt::Comments, clip)
  end
end
