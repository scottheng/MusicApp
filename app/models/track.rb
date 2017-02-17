class Track < ActiveRecord::Base
  CLASS = %w(bonus regular)

  validates :title, :album_id, presence: true
  validates :classification, inclusion: {in: CLASS }

  belongs_to :album
end
