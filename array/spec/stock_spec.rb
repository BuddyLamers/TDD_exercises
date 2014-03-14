require 'rspec'
require 'stock'

describe "stock_picker" do

  it "returns empty array if <2 arguements are passed" do
    expect(stock_picker([1])).to eq([])
  end

  it "returns an array with 2 elements" do
    expect(stock_picker([1, 2]).length).to eq(2)
  end

  it "returns correct days in a simple case" do
    simple_case = [1, 2]
    expect(stock_picker(simple_case)).to eq([0, 1])
  end

  it "returns correct days in a harder case" do
    harder_case = [2, 1, 4, 3]
    expect(stock_picker(harder_case)).to eq([1,2])
  end

  it "returns an empty array if there is no profit" do
    no_profit = [4, 3, 2, 1]
    expect(stock_picker(no_profit)).to eq([])
  end

end