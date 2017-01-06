class Comment < ActiveRecord::Base
	
  attr_accessible :content
 belongs_to :micropost
  belongs_to :user
  validates :content, :presence => true, :length => {:maximum => 50}
  validates :user_id, :presence =>true
  validates :micropost_id, :presence =>true
  default_scope :order => 'comments.created_at DESC'
end
