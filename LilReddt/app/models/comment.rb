# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  validates_presence_of :content

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id

  belongs_to :post
end
