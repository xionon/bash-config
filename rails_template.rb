def commit(msg)
  git add: "."
  git commit: "-m '#{msg}'"
end

git :init
git add: '.'
git commit: "-a -m 'Initial commit'"

file 'Procfile', "web: bundle exec rails server -p $PORT"
file '.env', "RAILS_ENV=development\nPORT=3000\n"

commit "Setup foreman"

gem_group :development do
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'ruby-prof'
end

gem_group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'quiet_assets'
  gem 'faker'
end

after_bundle do
  generate "rspec:install", "--force"
  run("guard init")
  run("guard init rspec")
  application <<-CODE.strip_heredoc

    config.generators do |generate|
      generate.test_framework :rspec
      generate.helper false
      generate.javascript_engine false
      generate.stylesheets false
    end

  CODE
  commit "Finish setup"
end
