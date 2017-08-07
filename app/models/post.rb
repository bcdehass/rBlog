class Post < ApplicationRecord
	belongs_to :category
	belongs_to :users, optional: true 
	has_many :comments

	validates :title, presence: true
	validates :category_id, presence: true
	validates :body, presence: true 

	def self.search(query)
		where("title like ? OR body like ?", "%#{query}%", "%#{query}%") #search title and body 
	end
end
