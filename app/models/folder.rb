# == Schema Information
#
# Table name: folders
#
#  id          :bigint           not null, primary key
#  name        :string
#  posts_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Folder < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
