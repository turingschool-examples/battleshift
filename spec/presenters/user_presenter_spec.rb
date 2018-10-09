require "rails_helper"

describe UserPresenter do
  it 'exists' do
    user_presenter = UserPresenter.new

    expect(user_presenter).to be_a(UserPresenter)
  end

  context 'instance methods' do
    context '#single_user_object' do
      it 'should return a single user_display object' do
        user_presenter = UserPresenter.new({id: 1})

        expect(user_presenter.single_user_object).to be_a(UserDisplay)
      end
    end
  end
end
