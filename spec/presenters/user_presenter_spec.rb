require "rails_helper"

describe UserPresenter
  it 'exists' do
    user_presenter = UserPresenter.new

    expect(user_presenter).to be_a(UserPresenter)
  end

  context 'instance methods' do
    context '#single_user_object' do
      it 'should return a single user_display object' do
        user_presenter = UserPresenter.new

        expectuser_presenter.single_user_object({id: 1})).to be_a(UserDisplay)
      end
    end
  end
end
