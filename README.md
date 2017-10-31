# Inline::Erb

Adds sinatra style inline templating to your script files

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'inline-erb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install inline-erb

## Usage

```ruby
require 'inline-erb'

inline_template 'znc.conf',
                '/var/lib/znc/configs/znc.conf',
                port: config('port'),
                admin_user: config('admin_user'),
                admin_password: config('admin_password'),
                admin_password_salt: admin_password_salt,
                admin_password_hash: admin_password_hash

__END__

@@ znc.conf
Version = 1.6.3
<Listener l>
	  Port = <%= port %>
          IPv4 = true
          IPv6 = false
          SSL = false
</Listener>
LoadModule = webadmin

<User <%= admin_user %>>
	Admin      = true
	Nick       = <%= admin_user %>
	AltNick    = <%= admin_user %>_
	Ident      = <%= admin_user %>
	RealName   = ZNC Managed by Juju
	LoadModule = chansaver
	LoadModule = controlpanel
        <Pass <%= admin_password %>>
          hash = <%= admin_password_hash %>
          method = sha256
          salt = <%= admin_password_salt %>
        </Pass>
</User>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/battlemidget/inline-erb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Inline::Erb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/battlemidget/inline-erb/blob/master/CODE_OF_CONDUCT.md).
