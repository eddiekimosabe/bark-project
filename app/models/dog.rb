class Dog < ApplicationRecord
  has_many_attached :images
  # eager loading to deal with n+1
  scope :with_eager_loaded_images, -> {eager_load(images_attachments: :blob)}
  #ensures that when dog gets destroyed all likes associated with dog gets destroyed also
  has_many :likes, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id', optional: true
  # setting how pagination of how many dogs per page
	self.per_page = 5
end
