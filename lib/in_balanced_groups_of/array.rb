require 'active_support/core_ext/array'

module InBalancedGroupsOf
  module Array
    def self.in_balanced_groups_of(array, number, fill_with = nil)
      number = validate_integer(number)

      groups = array.size / number
      groups += 1 if array.size % number != 0
      return [] if groups == 0

      array.in_groups(groups, fill_with)
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
    end
  end
end

