require 'rails_helper'

RSpec.describe Employee, type: :model do

  context 'Validations check' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :contacts }
    it { should validate_presence_of :salary }

    it { should validate_numericality_of :salary }

  end

  let(:employee) { FactoryGirl.create(:employee) }

end


# validates :name, :contacts, :salary, presence: true
# validates :name, format: {
#     with: /\A[А-Яа-я]+ [А-Яа-я]+ [А-Яа-я]+\z/,
#     message: 'ФИО должно быть на кириллице и содержать 3 слова'}
# validates :contacts, format: {
#     with: /(\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z|^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)/,
#     message: 'Допускаются только email или телефонный номер' }
# validates :salary, numericality: true