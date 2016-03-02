require "spec_helper"
require 'in_balanced_groups_of'
#require 'pry'

RSpec.describe "InBalancedGroupsOf" do
  it "divide into x groups" do
    array = (1..30).to_a
    groups = array.divide_into_x_groups(4)
    expect(groups.size).to eq 4
    expect(groups[0].size).to eq 8
    expect(groups[1].size).to eq 8
    expect(groups[2].size).to eq 7
    expect(groups[3].size).to eq 7

    expect(groups[0]).to eq [1, 2, 3, 4, 5, 6, 7, 8]
    expect(groups[1]).to eq [9, 10, 11, 12, 13, 14, 15, 16]
    expect(groups[2]).to eq [15, 16, 17, 18, 19, 20, 21]
    expect(groups[3]).to eq [22, 23, 24, 25, 26, 27, 28]
  end

  it "returns a balanced set of groups for 30 / 4" do
    array = (1..30).to_a
    groups = array.in_balanced_groups_of(8)
    expect(groups.size).to eq 4
    expect(groups[0].size).to eq 8
    expect(groups[1].size).to eq 8
    expect(groups[2].size).to eq 7
    expect(groups[3].size).to eq 7
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
