class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skills

  validates :name, :expiration_date, :salary, :contacts, presence: true
  validates :salary, numericality: true
  validates :contacts, length: {maximum: 255}
end
