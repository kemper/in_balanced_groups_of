module InBalancedGroupsOf
  module Array
    def self.in_balanced_groups_of(array, number, fill_with = nil)
      number = validate_integer(number)

      groups = array.size / number
      groups += 1 if array.size % number != 0
      divide_into_x_groups array, groups
    end

    def self.divide_into_x_groups(array, number)
      number = validate_integer(number)

      group_size = array.size / number
      remainder = array.size % number

      group_sizes = ::Array.new(number, group_size)

      remainder.times do |i|
        group_sizes[i] = group_sizes[i] + 1
      end

      group_sizes.map.with_index do |group, index|
        start = group * index
        end_index = start + group
        array[start...end_index]
      end
    end

    def self.validate_integer(number)
      if number.to_i <= 0
        raise ArgumentError,
          "Group count must be a positive integer, was #{number.inspect}"
      end
      number.to_i
    end

    module InstanceMethods
      def in_balanced_groups_of(number, fill_with = nil)
        Array.in_balanced_groups_of(self, number, fill_with)
      end

      def divide_into_x_groups(number)
        Array.divide_into_x_groups(self, number)
      end
    end
  end
end

