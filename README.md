# assets_backpack #

A rails engine (proof-of-concept) to cache assets smartly and easy on browsers with local storage feature embedded

## USAGE: ##

Just require the gem on your Gemfile.

An option ":local_storage => true" on your include tag is enough to activate the feature

``` ruby
javascript_include_tag "test.js", { :local_storage => true }
```
