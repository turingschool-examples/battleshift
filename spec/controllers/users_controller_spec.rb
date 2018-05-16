require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'endpoints' do
    describe 'GET new' do
      it 'renders template' do
        get :new

        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      let(:user_params) { { name: 'Alien',
                            email: 'email@foreigndomain.com',
                            password: '1234',
                            password_confirmation: '1234' } }

      it 'makes a user' do
        post :create, params: { user: user_params  }

        expect(User.all.size).to eq(1)
        expect(User.first.activated?).to be_falsey
      end

      it 'redirects to dashboard' do
        post :create, params: { user: user_params }

        expect(response).to redirect_to(:dashboard)
      end

      it 'logs user in with valid information' do
        post :create, params: { user: user_params }

        expect(session[:user_id]).to_not be_nil
      end

      it 'will not create an invalid user' do
        post :create, params: { user: user_params }
        post :create, params: { user: user_params }

        expect(response).to render_template(:new)
        expect(flash[:notice]).to eq('Please try again!')
      end
    end

    describe 'GET show' do
      let(:user) { create(:user)}

      it 'renders template successfully' do
        session[:user_id] = user.id
        get :show 

        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end
  end
end
