class Blog < ActiveRecord::Base
	attr_accessible :content, :title, :user_id, :tags_attributes

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :tags

  	validates :content, :presence => true
  	validates :title, :presence => true

  	accepts_nested_attributes_for :tags, :allow_destroy => :true,
  		:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
