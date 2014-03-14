require 'rspec'
require 'array'

describe Array do
  describe '#my_uniq' do
    it "has been monkey patched" do
      array = Array.new
      expect(array).to respond_to(:my_uniq)
    end

    it "returns an array" do
      expect([1, 2].my_uniq).to be_an(Array)
    end

    it "returns same array if all items unique" do
      expect([1, 2].my_uniq).to eq([1, 2])
    end

    it "removes one duplicate if only 1 dup found" do
      expect([1, 2, 1].my_uniq).to eq([1, 2])

    end

    it "removes all duplicates found for an item" do
      expect([1, 2, 1, 2].my_uniq).to eq([1, 2])

    end

    it "returns an empty array if we give an empty array" do
      expect([].my_uniq).to eq([])
    end

  end

  describe '#two_sum' do
    let(:test_array) do
      [-1, 0, 2, -2, 1]
    end

    it "array responds to two_sum" do
      array = Array.new
      expect(array).to respond_to(:two_sum)
    end

    it 'returns an array' do
      expect(test_array.two_sum).to be_an(Array)
    end

    it 'returns an empty array if given empty array' do
      expect([].two_sum).to eq([])
    end

    it 'returns an array that contains arrays' do
      expect(test_array.two_sum[0]).to be_an(Array)
    end

    it 'returns subarrays of length 2' do
      expect(test_array.two_sum[0].length).to eq(2)
    end

    it 'returns subarrays containing indices of elements that sum to 0' do
      x, y = test_array.two_sum[0]
      expect(test_array[x] + test_array[y]).to eq(0)
    end

    it 'returns pairs of indicies in numerical order' do
      expect(test_array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end