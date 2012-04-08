class Comment < ActiveRecord::Base
  belongs_to            :commentable, :polymorphic => true

  belongs_to            :tee
  belongs_to            :user
  attr_accessible       :content, :user_id
  validates_presence_of :content
  validates_length_of   :content, :maximum => 2000
  

end
