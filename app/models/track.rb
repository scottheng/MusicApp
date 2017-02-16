class Track < ActiveRecord::Base
  validates :title, :classification, :album_id, presence: true

  belongs_to :album, dependent: :destroy
end
