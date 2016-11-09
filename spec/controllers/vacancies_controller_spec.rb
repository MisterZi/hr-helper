require 'rails_helper'

RSpec.describe VacanciesController, type: :controller do

  let(:vacancy) { FactoryGirl.create(:vacancy) }

  context 'Actions' do
    it 'create vacancy' do
      post :create, :vacancy => {name: 'тест',
           expiration_date: '2017-01-01',
           salary: '100',
           contacts: 'test',
           skill_data: ['ruby']}

      vacancy = assigns(:vacancy)

      expect(response).to redirect_to(vacancy_path(vacancy))
      expect(flash[:notice]).to be
    end

    it '#show vacancy' do
      get :show, id: vacancy.id

      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end

    it '#delete vacancy' do
      delete :destroy, id: vacancy.id

      expect(response).to redirect_to(vacancies_url)
      expect(flash[:notice]).to be
    end

    it '#update vacancy' do
      put :update, id: vacancy.id, :vacancy => FactoryGirl.attributes_for(:vacancy)

      expect(response).to redirect_to(vacancy_path(vacancy))
      expect(flash[:notice]).to be
    end
  end

end

