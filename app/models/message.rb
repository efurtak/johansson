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
class Message < ApplicationRecord
  validates :imie_i_nazwisko, presence: true
  validates :email, presence: true
end
