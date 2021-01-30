class Artist < ApplicationRecord
  include Rails.application.routes.url_helpers
  validates :name, presence: true, length: {  minimum: 1, maximum: 254 }, allow_blank: false
  has_one_attached :image
  paginates_per 20


  def to_json
    json_to_render = self.attributes
    if self.image.attached?
      json_to_render[:image] = url_for self.image
    end
    json_to_render
  end
end
