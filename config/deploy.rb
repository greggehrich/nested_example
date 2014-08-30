# set :default_env, {
#     'PATH' => "/home/wjgilmorecom/ruby/bin/ruby:$PATH",
#     'RUBY_VERSION' => 'ruby-2.0.0-p247'
# }

#set :rvm_ruby_version, 'ruby-2.0.0-p247'

set :application, 'arcadenomad'
set :repo_url, 'git@github.com:wjgilmore/arcadenomad.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/home/rails/arcadenomad.com'

set :rake, 'bundle exec rake'

set :scm, :git
set :user, :rails
set :use_sudo, false
set :branch, 'master'

set :tmp_dir, '/home/rails/arcadenomad.com/tmp'

set :pty, true

set :keep_releases, 3

set :log_level, :debug

# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

set :linked_files, %w{config/database.yml config/initializers/admin_credentials.rb app/views/shared/_ga.html.erb config/application_config.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute '/etc/init.d/unicorn restart'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end