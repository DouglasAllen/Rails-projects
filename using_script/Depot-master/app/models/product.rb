class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  # Description, image and title must be present
  validates :description, :image_url, :title, presence: true

  # Title must be uniqune
  validates :title, uniqueness: true

  # Image must be in format of .gif, .jpg and .png (done using regural expression)
  validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|jpg|png)$}i,
	message: 'must be a URL for GIF, JPG or PNG image.'
	}

  # Price must be number and should be greater than or equal to 0.01
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  # Product has many line items (i.e Product has one to many relationship with Line Item)
  has_many :line_items

  # Product has many orders throught line items (i.e Product has many to many relationship with orders)
  has_many :orders, through: :line_items

  # Doesnot allow to destroy any line item before destroying it
  before_destroy :ensure_not_referenced_by_any_line_item
 
  private

  # Method that define item is present or not
  # ensure that there is no line items referencing this product
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, 'Line Items present')
  		return false
  	end 		
  end

  # set per_page to show in product list
  self.per_page = 5

  # Method to define file for CSV
  # set row as column names
  # set other attributes as column names agruments
  def self.to_csv(options = {})
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end    
  end

  def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    document = find_by_id(row["id"]) || new
    document.attributes = row.to_hash.slice(*accessible_attributes)
    document.save!
  end
end
  
end
