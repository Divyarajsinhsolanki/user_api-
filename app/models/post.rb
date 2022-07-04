class Post < ApplicationRecord
  belongs_to :user


  has_many_attached :images
  has_many :comments, as: :commented_on
  
  has_many :vote, as: :liked
  has_many :dislikes, as: :disliked

  validates :title, :presence => {:message => "Ttitle can't be blank." }, length: {minimum: 2, maximum: 50}
  validates :content,  :presence => {:message => "Content can't be blank." }, length: {minimum: 2, maximum: 500}

end

