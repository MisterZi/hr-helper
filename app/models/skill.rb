class Skill < ActiveRecord::Base
  has_and_belongs_to_many :vacancies

  validates :name, presence: true
end
