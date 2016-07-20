file 'Procfile', "web: bundle exec rails server -p $PORT"
file '.env', "RAILS_ENV=development\nPORT=3000\n"

gem_group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'faker'
end

after_bundle do
  generate "rspec:install", "--force"
  application do
    <<-CODE

    config.generators do |generate|
      generate.test_framework :rspec
      generate.helper false
      generate.javascript_engine false
      generate.stylesheets false
    end
    CODE
  end

  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
