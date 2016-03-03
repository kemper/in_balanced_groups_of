require "spec_helper"
require 'in_balanced_groups_of'
#require 'pry'

RSpec.describe "InBalancedGroupsOf" do
  describe "#divide_into_x_groups" do
    it "raises ArgumentError if the number is less than zero" do
      expect {
        [].divide_into_x_groups(-1)
      }.to raise_error ArgumentError
    end

    it "raises ArgumentError if the number is zero" do
      expect {
        [].divide_into_x_groups(0)
      }.to raise_error ArgumentError
    end

    it "raises ArgumentError if the number is a small float" do
      expect {
        [].divide_into_x_groups(0.1)
      }.to raise_error ArgumentError
    end

    it "divide 30 into 4 groups evenly" do
      array = (1..30).to_a
      groups = array.divide_into_x_groups(4)
      expect(groups.size).to eq 4
      expect(groups[0].size).to eq 8
      expect(groups[1].size).to eq 8
      expect(groups[2].size).to eq 7
      expect(groups[3].size).to eq 7

      expect(groups[0]).to eq [1, 2, 3, 4, 5, 6, 7, 8]
      expect(groups[1]).to eq [9, 10, 11, 12, 13, 14, 15, 16]
      expect(groups[2]).to eq [17, 18, 19, 20, 21, 22, 23]
      expect(groups[3]).to eq [24, 25, 26, 27, 28, 29, 30]
    end

    it "returns a balanced set of groups for 2 / 3" do
      array = [1,2]
      groups = array.divide_into_x_groups(3)
      expect(groups.size).to eq 3
      expect(groups[0]).to eq [1]
      expect(groups[1]).to eq [2]
      expect(groups[2]).to eq []
    end

    it "works with empty arrays" do
      array = []
      groups = array.divide_into_x_groups(3)
      expect(groups.size).to eq 3
      expect(groups[0]).to eq []
      expect(groups[1]).to eq []
      expect(groups[2]).to eq []
    end

    it "works with argument greater than array" do
      array = [1]
      groups = array.divide_into_x_groups(100)
      expect(groups.size).to eq 100
      expect(groups[0]).to eq [1]
      expect(groups[1]).to eq []
    end

    it "works with floats" do
      array = [1,2,3]
      groups = array.divide_into_x_groups(3.0)
      expect(groups).to eq [[1], [2], [3]]
    end
  end

  describe "#in_balanced_groups_of" do
    it "raises ArgumentError if the number is less than zero" do
      expect {
        [].in_balanced_groups_of(-1)
      }.to raise_error ArgumentError
    end

    it "raises ArgumentError if the number is zero" do
      expect {
        [].in_balanced_groups_of(0)
      }.to raise_error ArgumentError
    end

    it "raises ArgumentError if the number is a small float" do
      expect {
        [].in_balanced_groups_of(0.1)
      }.to raise_error ArgumentError
    end

    it "works with empty arrays" do
      array = []
      groups = array.in_balanced_groups_of(100)
      expect(groups.size).to eq 1
      expect(groups).to eq [[]]
    end

    it "works with argument greater than array" do
      array = [1]
      groups = array.in_balanced_groups_of(100)
      expect(groups).to eq [[1]]
    end

    it "works with floats" do
      array = [1,2,3]
      groups = array.in_balanced_groups_of(1.0)
      expect(groups.size).to eq 3
      expect(groups).to eq [[1], [2], [3]]
    end

    it "returns a balanced set of groups for 30 / 4" do
      array = (1..30).to_a
      groups = array.in_balanced_groups_of(8)
      expect(groups.size).to eq 4
      expect(groups[0]).to eq [1,2,3,4,5,6,7,8]
      expect(groups[1]).to eq [9,10,11,12,13,14,15,16]
      expect(groups[2]).to eq [17, 18, 19, 20, 21, 22, 23]
      expect(groups[3]).to eq [24, 25, 26, 27, 28, 29, 30]
    end

    it "returns a balanced set of groups for 30 / 3" do
      array = (1..30).to_a
      groups = array.in_balanced_groups_of(10)
      expect(groups.size).to eq 3
      expect(groups[0].size).to eq 10
      expect(groups[1].size).to eq 10
      expect(groups[2].size).to eq 10
    end

    it "returns a balanced set of groups for 13 / 4" do
      array = (1..13).to_a
      groups = array.in_balanced_groups_of(4)
      expect(groups.size).to eq 4
      expect(groups[0].size).to eq 4
      expect(groups[1].size).to eq 3
      expect(groups[2].size).to eq 3
      expect(groups[3].size).to eq 3
    end
  end
end
