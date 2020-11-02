class User < ApplicationRecord
  has_many :citas
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def formatted_name
    "#{name} #{surname}"
  end
end
