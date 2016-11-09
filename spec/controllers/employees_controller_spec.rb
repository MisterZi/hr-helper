require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do
  let(:employee) { FactoryGirl.create(:employee) }

  context 'Actions' do
    it 'create employee' do
      post :create, :employee => {name: 'тест тест тест',
                                 status: true,
                                 salary: '100',
                                 contacts: 'mail@mail.com',
                                 skill_data: ['ruby']}

      employee = assigns(:employee)

      expect(response).to redirect_to(employee_path(employee))
      expect(flash[:notice]).to be
    end

    it '#show employee' do
      get :show, id: employee.id

      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end

    it '#delete employee' do
      delete :destroy, id: employee.id

      expect(response).to redirect_to(employees_url)
      expect(flash[:notice]).to be
    end

    it '#update employee' do
      put :update, id: employee.id, :employee => FactoryGirl.attributes_for(:employee)

      expect(response).to redirect_to(employee_path(employee))
      expect(flash[:notice]).to be
    end
  end

end
