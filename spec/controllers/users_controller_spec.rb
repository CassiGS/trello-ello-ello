require 'rails_helper'

describe UsersController do
  context 'GET #new' do
    before(:each) do
      get :new
    end

    it 'returns a status code of 200' do
      expect(response.status).to eq 200
    end

    it 'assigns user to @user' do
      expect(assigns[:user]).to be_a_new(User)
    end

    it 'renders a new (register) view' do
      expect(response).to render_template(:new)
    end
  end

  context 'POST #create' do
    before(:each) do
       post :create, params: { user: FactoryGirl.attributes_for(:user) }
    end

    it 'creates new contact with valid attributes' do
      expect { post :create, params: { user: FactoryGirl.attributes_for(:user) } }.to change{User.count}.by(1)
    end

    it 'does not create contact without valid attributes' do
      expect { post :create, params: { user: { username: nil } }}.to change{User.count}.by(0)
    end

    it 'redirects to home page' do
      expect(response.status).to eq 302
    end

  end
end
