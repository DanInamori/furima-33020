class OrderData
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :house_num, :building_name, :phone_num, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_num
    validates :phone_num, length: { maximum: 11, message: 'Too long' }
    validates :user_id
    validates :item_id

  end
  

  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_num: house_num, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end
end