[x] try gem update to fix sql gem issue
[x] get support re ```Specified 'sqlite3' for database adapter, but the gem is not loaded. Add `gem 'sqlite3'` to your Gemfile (and ensure its version is at the minimum required by ActiveRecord).``` when I run rails s
Tech coach had me uninstall the existing versions of sqlite and replace its line in Gemfile with `gem 'sqlite3', '~> 1.3.7'` Success!