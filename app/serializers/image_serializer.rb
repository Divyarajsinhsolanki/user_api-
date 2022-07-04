class ImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id ,:image_url

  def image_url
    rails_representation_url(object, host: "localhost", port:3000)
  end
end
