# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  imie_i_nazwisko :text
#  email           :text
#  komentarz       :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
