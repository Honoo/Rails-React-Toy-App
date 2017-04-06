# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  role_id         :integer
#

class User < ApplicationRecord
  belongs_to :role
  has_secure_password

  validates :email, :password, :role_id, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }
end
