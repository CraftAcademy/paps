unless Rails.env.production?
    require 'rspec/core/rake_task'
    require 'cucumber/rake/task'
    require 'coveralls/rake/task'
  
    Coveralls::RakeTask.new
  
    namespace :ci do
      task tests: [:spec, :cucumber, 'coveralls:push']
    end
end