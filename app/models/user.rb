class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def formatted_name
    "#{name} #{surname}"
  end
end
