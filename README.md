# InBalancedGroupsOf

This is an in order, balanced version of in_groups_of.

This provides functionality similar to in_groups_of.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'in_balanced_groups_of'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install in_balanced_groups_of

## Usage

By default, the gem adds 2 methods to Array: in_balanced_groups_of and divide_into_x_groups

You can choose to not monkey patch Array and just use the functions by doing:

```ruby
gem 'in_balanced_groups_of', require: "in_balanced_groups_of/array"
```

and then calling the functions directly:

```ruby
InBalancedGroupsOf::Array.in_balanced_groups_of(array, 3)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/in_balanced_groups_of/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
