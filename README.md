# Todoist

Todoist API Wrapper for ruby.
API version 2014 is supported.

## Installation

Add this line to your application's Gemfile:

    gem 'todoist-ruby', require: 'todoist'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todoist-ruby

And then add this line to your code:

    require 'todoist'
    
## Basic Usage
### Configure access token
This step has to be executed before you do any interaction with Todoist API

```
[13] pry(main)> Todoist::Configuration.token = 'e6705ab0SECRETTOKENcfbcc1b'
=> "e6705ab0SECRETTOKENcfbcc1b"
```

### List your projects
```

[14] pry(main)> Todoist::Project::getProjects
=> [{"last_updated"=>"",
  "color"=>"#dddddd",
  "collapsed"=>0,
  "inbox_project"=>true,
  "archived_date"=>nil,
  "indent"=>1,
  "cache_count"=>0,
  "is_deleted"=>0,
  "id"=>1344864235,
  "user_id"=>3296152,
  "name"=>"Inbox",
  "item_order"=>0,
  "archived_timestamp"=>0,
  "is_archived"=>0},
 {"last_updated"=>"",
  "color"=>"#fc603c",
  "collapsed"=>0,
  "archived_date"=>nil,
  "indent"=>1,
  "cache_count"=>0,
  "is_deleted"=>0,
  "id"=>1344864245,
  "user_id"=>3296152,
  "name"=>"Personal",
  "item_order"=>1,
  "archived_timestamp"=>0,
  "is_archived"=>0},
     ...
```
### List items in a specific project

```
[14] pry(main)> project = Todoist::Project.get 13464256
[15] pry(main)> project.items.uncompleted.each { |item| puts "* #{item.content}" } 
* get powers
* write down plans
* conquer the world
[16] pry(main)>
```


## Contributing

1. Fork it ( https://github.com/chsh/todoist-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Bugs (TODO)

- Only some features are implemented.
- Implement all API calls.
- Implement Sync API calls.
