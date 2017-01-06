class Micropost < ActiveRecord::Base
  attr_accessible :content,:title
	belongs_to :user
	has_many :commends, :dependent => :delete_all
	validates :content, :presence =>true, :length => {:maximum => 400}
	validates :title, :presence =>true, :length => {:maximum => 140}
	validates :user_id, :presence =>true
	default_scope :order => 'microposts.created_at DESC'
end
