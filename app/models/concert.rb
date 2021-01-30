class Concert < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :artist
  belongs_to :locality
  has_one_attached :cover_image

  validates :date, presence: true

  
  
  def to_json
    json_to_render = self.attributes
    if self.cover_image.attached?
      json_to_render[:cover_image] = url_for self.cover_image
    end
    json_to_render
  end

  private

end
