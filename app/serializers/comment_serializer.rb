class CommentSerializer < ActiveModel::Serializer
  attributes :id ,:body,:created_by_id,:vote 


  belongs_to :created_by, class_name: "User"
  belongs_to :commented_on, polymorphic: true

  # def created_by_id
  #   User.find(object.created_by_id).email
  # end

  def vote
    {like: object.vote.where(action_type: "like").size, 
    dislike: object.vote.where(action_type: "dislike").size
    }
  end

  def dislikes
     object.dislikes.size
  end


end
