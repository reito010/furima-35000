class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :area
  belongs_to :cost
  belongs_to :delivery


  validates :name, :text, :price, presence: true


  with_options numericality: { other_than: 1 } do

  validates :category_id
  validates :status_id
  validates :cost_id
  validates :area_id
  validates :delivery_id 
  
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000}
  end
end
