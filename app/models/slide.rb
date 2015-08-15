# == Schema Information
#
# Table name: slides
#
#  id          :integer          not null, primary key
#  title       :string(64)       not null
#  image_url   :string
#  description :string           not null
#  body        :text
#  user_id     :integer          not null
#  published   :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_slides_on_user_id  (user_id)
#

class Slide < ActiveRecord::Base
  belongs_to :user

  scope :published, -> { where(published: true) }

  validates :title,
    presence: true,
    length: { maximum: 64 }

  validates :description,
    presence: true,
    length: { maximum: 255 }

  validates :image_url,
    presence: true,
    length: { maximum: 255 }

  validates :body,
    presence: true

  validates :user_id,
    presence: true,
    numericality: { greater_than: 0, only_integer: true, allow_blank: true }
end
