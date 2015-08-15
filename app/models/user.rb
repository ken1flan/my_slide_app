# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nickname   :string(64)       not null
#  icon_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :identities, dependent: :destroy

  validates :nickname,
    presence: true,
    length: { maximum: 64 }

  validates :icon_url,
    length: { maximum: 255 }

  def self.create_with_identity(auth)
    nickname = auth[:info][:nickname]
    nickname ||= auth[:info][:name]
    icon_url = auth[:info][:image]
    user = create!(nickname: nickname, icon_url: icon_url)
    identity = Identity.create!({
      user_id: user.id,
      provider: auth[:provider],
      uid: auth[:uid]
    })

    user
  end

  def self.find_from(auth)
    user = User.joins(:identities).
      merge(Identity.where(provider: auth[:provider], uid: auth[:uid])).
      first
    user
  end
end
