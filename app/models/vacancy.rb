class Vacancy < ActiveRecord::Base
  has_and_belongs_to_many :skills

  validates :name, :expiration_date, :salary, :contacts, presence: true
  validates :salary, numericality: true
  validates :contacts, length: {maximum: 255}

  def skills_data=(value)
    skills.clear

    return if value.nil?

    value.uniq.each do |s|
      skill = Skill.find_or_create_by name: s
      skills << skill
    end
  end

  def skills_data
    skills.map { |s| s.name }.to_json
  end

  def suitable

    suitable_employees = []

    employees = Employee.where(status: true).order(:salary)
    employees.each do |employee|
      if skills.ids.all? { |e| employee.skills.ids.include?(e) }
        suitable_employees << employee
      end
    end

    suitable_employees
  end
end
