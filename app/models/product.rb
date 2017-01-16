class Product < ApplicationRecord
	has_attached_file :image, styles: { medium: "70x70>", thumb: "100x100>" }, default_url: "/assets/default.jpg"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	private
	def ensure_not_referenced_by_any_line_item
	 if line_items.empty?
	  return true
	 else
	  errors.add(:base, 'Line Items present')
	  return false
	 end
	end
end 
