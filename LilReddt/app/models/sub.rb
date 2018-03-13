# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, presence: true

  belongs_to :moderator,
    foreign_key: :mod_id,
    class_name: :User

  has_many :sub_posts,
    class_name: :PostSub,
    foreign_key: :sub_id

  has_many :posts,
    through: :post_subs,
    source: :post

end
