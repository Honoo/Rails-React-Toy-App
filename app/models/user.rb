# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ApplicationRecord
  belongs_to :role
  has_secure_password

  validates :email, :password, presence: true
  validates :password, length: { minimum: 6 }
end
