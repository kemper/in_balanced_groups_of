module InBalancedGroupsOf
  module Array
    def self.in_balanced_groups_of(array, number)
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

      last_index = 0
      group_sizes.map do |group|
        start = last_index
        end_index = start + group
        last_index = end_index
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
      def in_balanced_groups_of(number)
        Array.in_balanced_groups_of(self, number)
      end

      def divide_into_x_groups(number)
        Array.divide_into_x_groups(self, number)
      end
    end
  end
end

