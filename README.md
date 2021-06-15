# rpush-plugin-prometheus-exporter

Rpush plugin for exporting metrics to prometheus_exporter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rpush-plugin-prometheus-exporter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rpush-plugin-prometheus-exporter

## Configuration

```ruby
Rpush.config do |config|
  config.plugin.prometheus_exporter do |plugin_config|
    plugin_config.host = "127.0.0.1"
    plugin_config.port = 9394
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rpush-plugin-prometheus-exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
