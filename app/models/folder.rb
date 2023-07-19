# == Schema Information
#
# Table name: folders
#
#  id          :bigint           not null, primary key
#  name        :string
#  posts_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Folder < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  broadcasts_to ->(folder) { :folders }, inserts_by: :append, target: "folders"
  after_update -> { broadcast_replace_to :folder, partial: "folders/folder", locals: {folder: self} }

  default_scope { order(id: :asc) }
end
