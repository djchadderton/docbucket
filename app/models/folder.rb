# == Schema Information
#
# Table name: folders
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Folder < ApplicationRecord
  has_many :posts, dependent: :destroy
end
