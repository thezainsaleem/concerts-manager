class Locality < ApplicationRecord
  validates :name, presence: true, length: {  minimum: 1, maximum: 254 }, allow_blank: false
  validates :address, presence: true, allow_blank: false
  paginates_per 20
end
