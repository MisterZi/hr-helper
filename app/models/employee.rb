class Employee < ActiveRecord::Base
  has_and_belongs_to_many :skills

  validates :name, :contacts, :salary, presence: true
  validates :name, format: {
      with: /\A[А-Яа-я]+ [А-Яа-я]+ [А-Яа-я]+\z/,
      message: 'ФИО должно быть на кириллице и содержать 3 слова'}
  validates :contacts, format: {
      with: /(\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z|^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)/,
      message: 'Допускаются только email или телефонный номер' }
  validates :salary, numericality: true

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
end
