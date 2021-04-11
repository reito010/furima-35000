class OrderAddress
 include ActiveModel::Model
 attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :street, :building, :phone_number, :token

 
 with_options presence: true do
  validates :token
  validates :item_id
  validates :user_id
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id
  validates :city
  validates :street
  validates :phone_number
 end
  
 validates :area_id, numericality: {other_than: 1, message: "can't be blank"}
 validates :phone_number, length: { maximum: 11 }  


 def save
   order = Order.create(item_id: item_id, user_id: user_id)
         # Order.create(カラム名: コントローラーから送られてきた値 = attr_accessorで定義したもの)
   Address.create(postal_code: postal_code, area_id: area_id, city: city, street: street, phone_number: phone_number, order_id: order.id)
 end
end
