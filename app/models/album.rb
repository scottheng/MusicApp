class Album < ActiveRecord::Base
  CATEGORIES = %w(live studio)

  validates :title, :year, :genre, :band_id, presence: true
  validates :category, inclusion: {in: CATEGORIES}

  belongs_to :band

  has_many :tracks, dependent: :destroy
end
