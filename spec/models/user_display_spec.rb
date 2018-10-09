require "rails_helper"

describe UserDisplay do
  it 'exsits' do
    hash = {
              id: 1,
              name: "Billy Bob",
              email: billybob@example.com
            }

    user_display = UserDisplay.new(hash)

    expect(user_display).to be_a(UserDisplay)
  end

  it 'has specific attributes' do
    hash = {
              id: 1,
              name: "Billy Bob",
              email: billybob@example.com
            }

    user_display = UserDisplay.new(hash)

    expect(user_display.id).to eq(hash[:id])
    expect(user_display.name).to eq(hash[:name])
    expect(user_display.email).to eq(hash[:email])
  end
end
