require "rails_helper"

describe Space, type: :model do
  it "is initialized with correct attributes" do
    space = Space.new("A1")

    expect(space.class).to eq(Space)
    expect(space.coordinates).to eq("A1")
    expect(space.contents).to eq(nil)
    expect(space.status).to eq("Not Attacked")
  end

  it "status changes to miss when attacked and not occupied" do
    space = Space.new("A1")

    expect(space.status).to eq("Not Attacked")

    space.attack!

    expect(space.status).to eq("Miss")
  end

  it "status changes to hit when attacked and occupied" do
    space = Space.new("A1")
    space.occupy!(Ship.new(2))

    expect(space.status).to eq("Not Attacked")
    expect(space.contents.class).to eq(Ship)

    space.attack!

    expect(space.status).to eq("Hit")
  end
end
