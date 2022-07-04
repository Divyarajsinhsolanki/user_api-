class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content ,:images,:vote 

  belongs_to :user, if: :usss

  has_many :comments, as: :commented_on
  has_many :vote, as: :liked

  def vote
    {like: object.vote.where(action_type: "like").size, 
    dislike: object.vote.where(action_type: "dislike").size
    }
  end

  def dislikes
    object.dislikes.size
  end

  def usss
    @instance_options[:include_user]
  end

  def images
    object.images.map{ |image|
      { id:image.id,  
        url:  Rails.application.routes.url_helpers.rails_representation_url(image, host: "localhost", port:3000)
      }
    }
  end

  # def imagess
  #   object.images.map{|image|ImageSerializer.new(image)}
  # end

end
