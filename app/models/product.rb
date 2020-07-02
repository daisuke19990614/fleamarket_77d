class Product < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id",optional: true
  #意味：userテーブルをseller/buyerに変更、カラム名はseller_id・buyer_idで外部キーだよ
  #optional: true＝今は購入者は関係ないのでNULLデータでもDBに入る様設定している。これがないとデータがないと判断しDBに商品のレコードが残らない。


  # active-hash勢アソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :preparation_day
  # 上記大野商品出品機能のため追記

  # バリデーション
  validates :prefecture, presence: true
  validates :condition, presence: true
  validates :postage, presence: true
  validates :preparation_day, presence: true
  validates :pricing, presence: true
  validates :product_images, presence: true

 
  # has_many :comments, dependent: :destroy
  # has_many :users, through: :comments
  # has_many :favorites, dependent: :destroy
  # has_many :users, through: :favorites
  
  # belongs_to :category, dependent: :destroy
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true
  # ↑１行追記(みやじ、product.scss new.html, product_image)
end
