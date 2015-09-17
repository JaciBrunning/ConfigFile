# ConfigFile
ConfigFile is a simple gem designed to make Configuration Files with defaults that can be read from the FileSystem. ConfigFile supports both YAML and JSON formats.

## Getting Started
Getting started with Go.rb is very simple. First, install the Gem:
```
  gem install configfile
```
or, in your gem file:  
```ruby
  gem 'configfile'
```

Using the gem is very simple.
```ruby
require 'configfile'
cfg = ConfigFile.new "myfile.yaml", {:my => "defaults"}
cfg.load
puts cfg[:my]

# => "defaults"
```
If the user adds something to their config file, it will be accessable through the same means once it has been loaded. If a default is overridden in the final file, that value will be used instead of the default.

Manipulating the defaults can be very simple, as shown here:
```ruby
require 'configfile'
cfg = ConfigFile.new "myfile.yaml", {:my => "defaults"}

cfg.defaults {:my => "new_defaults"}
cfg.load
puts cfg[:my]

# => "new_defaults"
```

Additionally, the format of the file can be changed:
```ruby
require 'configfile'
cfg = ConfigFile.new "myfile.yaml", {:my => "defaults"}
cfg.format :json
cfg.load
```
This will cause the resultant file to be in JSON format.
