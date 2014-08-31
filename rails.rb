#################### helpers

def _gem(gem_info)
  if gem_info.is_a? String
    gem gem_info
  elsif gem_info.is_a? Array
    gem *gem_info
  end
end

def gem_ask(*gems)
  return if gems.empty?

  if gems.size == 1
    return unless yes?("Would you like to install #{gems[0]} ? > ")
    _gem gems[0]
  else
    return unless yes?(%Q{Would you like to install gems?\n- #{gems.join("\n- ")}\n > })

    gems.each do |gem_info|
      _gem gem_info
    end
  end
end

@after_bundle_tasks = []
def after_bundle(type, *args)
  if type.is_a?(Hash) && type.size == 1
    @after_bundle_tasks << type.first
  elsif type.is_a?(Symbol) || type.is_a?(String)
    @after_bundle_tasks << [type, args]
  end
end

####################
@use_heroku = yes?('use heroku for production?')

#################### ruby version
ruby_version = '2.0.0'
inject_into_file 'Gemfile', "ruby '#{ruby_version}'\n\n", before: "source 'https://rubygems.org'"

#################### shared gems

gem 'rails_config'; after_bundle generate: 'rails_config:install'

gem 'tapp'
gem 'draper'
gem 'simple_form'; after_bundle generate: 'simple_form:install --bootstrap'
gem 'quiet_assets'
gem "haml-rails"

if yes?('install unicorn?')
  gem 'unicorn'
  create_file 'Procfile', "web: bundle exec unicorn -p $PORT -c config/unicorn.rb\n"
  create_file 'config/unicorn.rb', <<-UNICORN_CONFIG
worker_processes 3
timeout 30
preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
end
  UNICORN_CONFIG
end

if yes?('install whenever?')
  gem 'whenever'; after_bundle run: 'bundle exec wheneverize .'
end

gem_ask 'nokogiri'
gem_ask ['bcrypt-ruby', '~> 3.0.0']

if yes?('install bootstrap 3 ?')
  gem 'anjlab-bootstrap-rails', '>= 3.0.0.0', :require => 'bootstrap-rails'
  run 'mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss'
  inject_into_file 'app/assets/stylesheets/application.scss', %Q{\n\n@import "twitter/bootstrap";\n}, after: '*/'
  inject_into_file 'app/assets/javascripts/application.js', %Q{\n//= require twitter/bootstrap\n}, after: '//= require_tree .'
end

#################### environment specific gems

gem_group :production do
  if @use_heroku
    gem 'pg'
    gem 'rails_12factor'
    # TODO remove `gem 'sqlite3'` from gemfile
  end
end

gem_group :development do
  gem 'erb2haml'; after_bundle rake: 'haml:replace_erbs'
  gem 'sqlite3'
end

gem_group :development, :test do
  gem "rspec-rails"; after_bundle generate: 'rspec:install'; after_bundle run: "echo '--color --drb -f d' > .rspec"
  gem 'annotator'

  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'awesome_print'

  gem 'database_rewinder'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'rack-mini-profiler'
  gem "bullet"

  if yes?('install capistrano 3?')
    gem 'capistrano', '>= 3.0.0.0'; after_bundle run: 'bundle exec cap install'
  end
end

#################### run after-bundle-tasks

run 'bundle install'

@after_bundle_tasks.each do |type, args|
  self.public_send type.to_sym, args
end

#################### memo
create_file 'memo.md' do
  <<-EOT
local memo
==========

  EOT
end
append_to_file '.gitignore', "\nmemo.md\n"



