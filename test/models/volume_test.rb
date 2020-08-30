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
require 'test_helper'

class VolumeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
