# == Schema Information
#
# Table name: volumes
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  pojemnosc  :string
#  cena       :decimal(10, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  waluta     :string
#
class Volume < ApplicationRecord
  belongs_to :product

  validates :pojemnosc, presence: true
  validates :cena, presence: true
  validates :waluta, presence: true
end
