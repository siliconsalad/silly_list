# SillyList

[![Gem Version](https://badge.fury.io/rb/silly_list.svg)](http://badge.fury.io/rb/silly_list)

Array like classes. Add Stack behavior, Queue is coming.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'silly_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install silly_list

## Usage

``` ruby
  class NumberList << SillyList::UniqLifo
  end

  number_list = NumberList.new([1,2,3], max_size: 2)
  number_list.list #=> [1,2]
  number_list.add(3)
  number_list.list #=> [3,1]
  number_list.add(3)
  number_list.list #=> [3,1]
  number_list.add([4,5])
  number_list.list #=> [4,5]
  number_list.remove #=> 4
  number_list.list #=> [5]
```

## Development

Documenation:

    $ bundle exec yard server --port 8828 --reload

Tests:

    $ rake spec

## Contributing

1. Fork it ( https://github.com/siliconsalad/silly_list/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
