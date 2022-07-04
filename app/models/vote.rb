class Vote < ApplicationRecord
  belongs_to :liked, polymorphic: true  

 # validates :user_like_id, uniqueness: { :scope => [:liked_id, :action_type, :liked_type]} 
  
  validates_uniqueness_of :user_like_id,  :scope => [:liked_id, :action_type, :liked_type] 

end
