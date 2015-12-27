class Product < ActiveRecord::Base
	extend FriendlyId 
  friendly_id :slug, use: :slugged

  belongs_to :product_category
  has_many :activity_records, as: :data

  mount_uploader :avatar, ProductAvatarUploader

  attr_accessor :checked_products, :checked_action

  after_create :create_diary_activity_record


  protected


  def create_diary_activity_record
    4.times do |i|
      time_range = TimeRange.create
      time_range.activity_records.create(data_id: self.id, data_type: "Product", period: 0, type_record: i)
    end  
  end

end
