require 'rails_helper'

RSpec.describe Vacancy, type: :model do

  context 'Validations check' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :expiration_date }
    it { should validate_presence_of :salary }
    it { should validate_presence_of :contacts }

    it { should validate_numericality_of :salary }
    it { should validate_length_of(:contacts).is_at_most(255) }
  end

  let(:vacancy) { FactoryGirl.create(:vacancy) }



end
