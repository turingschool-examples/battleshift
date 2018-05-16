require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'endpoints' do
    describe 'GET new' do
      it 'has a successful response' do
        get :new
      
        expect(response.status).to eq(200)
        expect(response).to render_template(:new)
      end
    end

    describe 'POST create' do
      let(:user) { create(:user) }

      describe 'successful login' do
        it 'redirects successfully' do
          post :create,  params: { email: user.email, password: user.password }

          expect(response).to redirect_to(:dashboard)
          expect(flash[:success]).to eq("Logged in as #{user.name}")
          expect(session[:user_id]).to eq(user.id)
          expect(response.status).to eq(302)
        end
      end

      describe 'failed login' do
        it 'renders the login template' do
          post :create, params: { email: user.email, password: '0' }

          expect(response).to render_template(:new)
          expect(flash.now[:danger]).to eq('Invalid credentials')
          expect(session[:user_id]).to be_nil
        end
      end
    end

    describe 'DELETE destroy' do
      it 'redirects to login' do
        delete :destroy

        expect(response).to redirect_to(:login)
        expect(session[:user_id]).to be_nil
      end
    end
  end
end
