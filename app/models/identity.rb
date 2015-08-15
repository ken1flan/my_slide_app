# == Schema Information
#
# Table name: identities
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  provider   :string(64)       not null
#  uid        :string(64)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_identities_on_provider_and_uid  (provider,uid) UNIQUE
#  index_identities_on_user_id           (user_id) UNIQUE
#

class Identity < ActiveRecord::Base
  validates :provider,
    presence: true,
    length: { maximum: 64 }

  validates :uid,
    presence: true,
    length: { maximum: 64 }
end
