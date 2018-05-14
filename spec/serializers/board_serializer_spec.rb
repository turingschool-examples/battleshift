require 'rails_helper'

describe BoardSerializer do
  let(:board) { Board.new(4) }
  let(:serializer) { described_class.new(board) }

  describe 'attributes' do
    it 'only has expected attributes' do
      attributes = %i[rows] 

      serializer.attributes.keys.each do |attr|
        expect(attr).to be_in(attributes)
      end
    end
  end

  describe 'instance methods' do
    it '#rows' do
      expected_keys = %i[name data]
      expect(serializer.rows).to be_an(Array)
      
      serializer.rows.first.keys.each do |key|
        expect(key).to be_in(expected_keys)
      end
    end
  end
end
