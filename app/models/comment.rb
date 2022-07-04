class Comment < ApplicationRecord

  belongs_to :created_by, class_name: :User, foreign_key: 'created_by_id'

  belongs_to :commented_on, polymorphic: true
  has_many :comments, as: :commented_on
  has_many :vote, as: :liked

  validates :body, :presence => {:message => "Comment can't be blank." }, length: {minimum: 2, maximum: 200}


end
