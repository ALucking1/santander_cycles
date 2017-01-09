require 'van'

describe Van do

  describe 'capacity' do
    it 'allows the user to set capacity for the van' do
      van = Van.new(10)
      expect(van.capacity).to eq(10)
    end

    it 'sets a default capacity if no capacity is given' do
      van = Van.new
      expect(van.capacity).to eq(20)
    end
  end

end
