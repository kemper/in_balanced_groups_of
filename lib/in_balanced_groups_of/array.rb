module InBalancedGroupsOf
  module Array
    def in_balanced_groups_of(number, fill_with = nil)
      groups = size / number
      groups += 1 if size % number != 0
      divide_into_x_groups groups
    end

    def divide_into_x_groups(number)
      group_size = self.size / number
      remainder = self.size % number

      group_sizes = ::Array.new(number, group_size)

      remainder.times do |i|
        group_sizes[i] = group_sizes[i] + 1
      end

      group_sizes.map.with_index do |group, index|
        start = group * index
        end_index = start + group
        self[start...end_index]
      end
    end
  end
end

