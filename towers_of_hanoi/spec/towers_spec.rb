require 'rspec'
require 'towers'

describe TowersOfHanoi do
  let(:default_towers) do
    [[1,2,3,4],[],[]]
  end

  subject(:towers) { TowersOfHanoi.new }

  describe '#initialize' do

    it "by default has three towers" do
      expect(towers.pegs.all?).to be_true
    end

    it "by default, tower1 has all disk" do
      expect(towers.pegs[0]).to eq(default_towers[0])
    end

    it "by default, towers 2 and 3 are empty arrays" do
      pegs2_3 = towers.pegs[1..2]
      expect(pegs2_3).to eq([default_towers[1],default_towers[2]])
    end
  end

  describe '#move_disk' do


    it "moves the disk to an empty tower" do
      towers.pegs = default_towers
      towers.move_disk(0,2)
      expect(towers.pegs).to eq([[2,3,4],[],[1]])
    end

    it "does not allow a move from an empty peg" do
      expect {towers.move_disk(1,2)}.to raise_error("empty peg")
    end

    it "moves the disk to a tower w/larger disk" do
      towers.pegs = [[1,2,3],[4],[]]
      towers.move_disk(0,1)
      expect(towers.pegs).to eq([[2,3],[1,4],[]])
    end

    it "does not allow a move onto a tower w/smaller disk" do
      towers.pegs = [[2,3,4],[1],[]]
      expect { towers.move_disk(0,1) }.to raise_error("invalid move")
    end

  end

  describe '#won?' do

    it "returns true if all disks are on peg3" do
      towers.pegs = [[], [], [1, 2, 3, 4]]
      expect(towers).to be_won
    end

    it "returns false if peg1 or peg2 has disks" do
      towers.pegs = [[1], [2], [1, 2, 3, 4]]
      expect(towers).not_to be_won
    end

  end

  describe '#render' do

    it "displays properly" do
      expect(towers.render).to eq("1234\n\n\n")
    end
  end

end
