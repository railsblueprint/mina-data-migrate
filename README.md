[![Gem Version](https://badge.fury.io/rb/mina-data-migrate.png)](http://badge.fury.io/rb/mina-data-migrate)


# Mina::DataMigrate

Plugin for Mina that adds support for [data migrations](https://github.com/ilyakatz/data-migrate)


## Installation & Usage

Add this line to your application's Gemfile:

```rb
gem 'mina-data-migrate', require: false
```

And then execute:

```shell
$ bundle
```

Require `mina/data-migrate` in your `config/deploy.rb`:

```rb
require 'mina/data_migrate'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

...

task setup: :environment do
  ...
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  ...
end
```


Update deploy task:

```rb
# config/deploy.rb

desc 'Deploys the current version to the server.'
task deploy: :environment do
  ... 
  # remove this line
  # invoke :'rails:db_migrate'
  
  # add new task
  invoke :'rails:db_data_migrate'
  ...
end
```

## Configuration

* `data_migration_dirs` - array of dirs with data migrations (['db/data'] by default) 


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
